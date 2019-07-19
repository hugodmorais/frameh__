class UsersDatatable < ApplicationDatatable
    delegate :user_path, to: :@view
    delegate :edit_user_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @users.map do |user|
        [].tap do |row|
          row << user.id
          row << user.name
          row << user.email
          links = [].tap do |link|
            link << link_to(user_path(user)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_user_path(user)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(user_path(user), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      users.count
    end
  
    def total_entries
      10
    end
  
    def users
      @users ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @users = User.all

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
          users = users.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @users
    end
  
    def order_columns
      %w[
        id
        name
        email
      ]
    end
  
    def search_columns
      %w[
        id
        name
        email
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  