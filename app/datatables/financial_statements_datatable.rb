class FinancialStatementsDatatable < ApplicationDatatable
    delegate :financial_statement_path, to: :@view
    delegate :edit_financial_statement_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @financial_statements.map do |financial_statement|
        [].tap do |row|
          row << financial_statement.id
          row << financial_statement.month
          row << financial_statement.account.name
          links = [].tap do |link|
            link << link_to(financial_statement_path(financial_statement)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_financial_statement_path(financial_statement)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(financial_statement_path(financial_statement), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      financial_statements.count
    end
  
    def total_entries
      10
    end
  
    def financial_statements
      @financial_statements ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @financial_statements = FinancialStatement.all

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
          financial_statements = financial_statements.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @financial_statements
    end
  
    def order_columns
      %w[
        id
        annual_management.year
        month
        account.name
      ]
    end
  
    def search_columns
      %w[
        id
        annual_management.year
        month
        account.name
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  