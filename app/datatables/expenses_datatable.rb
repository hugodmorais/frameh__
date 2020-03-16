class ExpensesDatatable < ApplicationDatatable
    delegate :expense_path, to: :@view
    delegate :edit_expense_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @expenses.map do |expense|
        [].tap do |row|
          row << expense.id
          row << expense.annual_management.year
          row << t('date.month_names')[expense.month]
                 
          links = [].tap do |link|
            link << link_to(expense_path(expense)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_expense_path(expense)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(expense_path(expense), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      expenses.count
    end
  
    def total_entries
      10
    end
  
    def expenses
      @expenses ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @expenses = Expense.in_year(Current.year)

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
          expenses = expenses.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @expenses
    end
  
    def order_columns
      %w[
        id
        month
        kind
        expense_value
        user_group
        annual_management
        expense_category
      ]
    end
  
    def search_columns
      %w[
        id
        month
        kind
        expense_value
        user_group
        annual_management
        expense_category
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  