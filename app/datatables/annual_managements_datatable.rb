class AnnualManagementsDatatable < ApplicationDatatable
    delegate :current_user, to: :@view
    delegate :annual_management_path, to: :@view
    delegate :edit_annual_management_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @annual_managements.map do |annual_management|
        [].tap do |row|
          row << annual_management.id
          row << annual_management.year
          row << annual_management.description
          links = [].tap do |link|
            link << link_to(annual_management_path(annual_management)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_annual_management_path(annual_management)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(annual_management_path(annual_management), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      annual_managements.count
    end
  
    def total_entries
      10
    end
  
    def annual_managements
      @annual_managements ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @annual_managements = AnnualManagement.by_user(current_user)

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
          annual_managements = annual_managements.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @annual_managements
    end
  
    def order_columns
      %w[
        id
        year
        description
      ]
    end
  
    def search_columns
      %w[
        id
        year
        description
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  