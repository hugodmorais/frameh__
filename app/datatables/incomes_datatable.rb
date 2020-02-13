class IncomesDatatable < ApplicationDatatable
    delegate :income_path, to: :@view
    delegate :edit_income_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @incomes.map do |income|
        [].tap do |row|
          row << income.id
          row << t('date.month_names')[income.month]
          if income.income_category.present?
            row << income.income_category.name
          else
            row << ''
          end
          row << ActionController::Base.helpers.number_to_currency(income.income_value)
          links = [].tap do |link|
            link << link_to(income_path(income)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_income_path(income)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(income_path(income), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      incomes.count
    end
  
    def total_entries
      10
    end
  
    def incomes
      @incomes ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @incomes = Income.in_year(Current.year)

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
          incomes = incomes.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @incomes
    end
  
    def order_columns
      %w[
        id
        month
        kind
        income_value
        user_group
        annual_management
        income_category
      ]
    end
  
    def search_columns
      %w[
        id
        month
        kind
        income_value
        user_group
        annual_management
        income_category
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  