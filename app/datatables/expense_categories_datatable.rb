class ExpenseCategoriesDatatable < ApplicationDatatable
    delegate :expense_category_path, to: :@view
    delegate :edit_expense_category_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @expense_categories.map do |expense_category|
        [].tap do |row|
          row << expense_category.id
          row << expense_category.name
          row << expense_category.primary_payment
          links = [].tap do |link|
            link << link_to(expense_category_path(expense_category)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_expense_category_path(expense_category)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(expense_category_path(expense_category), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
        expense_categories.count
    end
  
    def total_entries
      10
    end
  
    def expense_categories
      @expense_categories ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @expense_categories = ExpenseCategory.all

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
          expense_categories = expense_categories.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @expense_categories
    end
  
    def order_columns
      %w[
        id
        name
        primary_payment
      ]
    end
  
    def search_columns
      %w[
        id
        name
        primary_payment
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  