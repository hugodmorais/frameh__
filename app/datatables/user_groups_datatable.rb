class UserGroupsDatatable < ApplicationDatatable
    delegate :user_group_path, to: :@view
    delegate :edit_user_group_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @user_groups.map do |user_group|
        [].tap do |row|
          row << user_group.id
          row << user_group.first_name
          row << user_group.last_name
          row << user_group.birth_date.strftime("%F")
          row << user_group.to_s
          links = [].tap do |link|
            link << link_to(user_group_path(user_group)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_user_group_path(user_group)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(user_group_path(user_group), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      measures.count
    end
  
    def total_entries
      10
    end
  
    def measures
      @user_groups ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @user_groups = UserGroup.all

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
          user_groups = user_groups.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @user_groups
    end
  
    def order_columns
      %w[
        id
        first_name
        last_name
        genre
        birth_date
      ]
    end
  
    def search_columns
      %w[
        id
        first_name
        last_name
        genre
        birth_date
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  