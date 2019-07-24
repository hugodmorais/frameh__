class IncomeCategoriesDatatable < ApplicationDatatable
    delegate :income_category_path, to: :@view
    delegate :edit_income_category_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @income_categories.map do |income_category|
        [].tap do |row|
          row << income_category.id
          row << income_category.name
          links = [].tap do |link|
            link << link_to(income_category_path(income_category)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_income_category_path(income_category)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(income_category_path(income_category), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
        income_categories.count
    end
  
    def total_entries
      10
    end
  
    def income_categories
      @income_categories ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @income_categories = IncomeCategory.all

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
          income_categories = income_categories.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @income_categories
    end
  
    def order_columns
      %w[
        id
        name
      ]
    end
  
    def search_columns
      %w[
        id
        name
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  