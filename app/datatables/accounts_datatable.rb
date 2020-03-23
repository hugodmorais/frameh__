class AccountsDatatable < ApplicationDatatable
    delegate :account_path, to: :@view
    delegate :edit_account_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @accounts.map do |account|
        [].tap do |row|
          row << account.id
          row << account.name
          row << (account.main_account ? '<i class="fa fa-check"></i>' : '')
          row << (account.credit_account ? '<i class="fa fa-check"></i>' : '')
          row << (account.savings_account ? '<i class="fa fa-check"></i>' : '')
          row << account.country
          row << account.currency_kind&.name
          row << account.description
          links = [].tap do |link|
            link << link_to(account_path(account)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_account_path(account)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(account_path(account), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      accounts.count
    end
  
    def total_entries
      10
    end
  
    def accounts
      @accounts ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @accounts = Account.by_user(current_user)

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
          accounts = accounts.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @accounts
    end
  
    def order_columns
      %w[
        id
        name
        main_account
        credit_account
        savings_account
        country
        currency_kind&.name
        description
      ]
    end
  
    def search_columns
      %w[
        id
        name
        main_account
        credit_account
        savings_account
        country
        currency_kind&.name
        description
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  