class CurrencyKindsDatatable < ApplicationDatatable
    delegate :currency_kind_path, to: :@view
    delegate :edit_currency_kind_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @currency_kinds.map do |currency_kind|
        [].tap do |row|
          row << currency_kind.id
          row << currency_kind.key
          row << currency_kind.name
          links = [].tap do |link|
            link << link_to(currency_kind_path(currency_kind)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_currency_kind_path(currency_kind)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(currency_kind_path(currency_kind), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      currency_kinds.count
    end
  
    def total_entries
      10
    end
  
    def currency_kinds
      @currency_kinds ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @currency_kinds = CurrencyKind.all

      if search_values.present?
        search_values = search_values.split
        # Search in month description
        search_values.each do |search_value|
          month_numbers = months_to_search(search_value)
          query << "EXTRACT(MONTH FROM date_at) IN (#{month_numbers.join(', ')})" if month_numbers.any?
        end
        # CAST all fields to string
        search_columns.each do |term|
          query << "CAST(#{term} AS VARCHAR) ~* :search"
        end
  
        search_values.each do |search_value|
          search_value.sub! ',', '.' # replace , with . to do numeric search
          currency_kinds = currency_kinds.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @currency_kinds
    end
  
    def order_columns
      %w[
        id
        key
        name
      ]
    end
  
    def search_columns
      %w[
        id
        key
        name
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  