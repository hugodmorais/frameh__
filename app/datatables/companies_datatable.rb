class CompaniesDatatable < ApplicationDatatable
    delegate :company_path, to: :@view
    delegate :edit_company_path, to: :@view
  
    def valid?
      true
    end
  
    def data
      @companies.map do |company|
        [].tap do |row|
          row << company.id
          row << company.name
          row << company.country
          row << company.city
          links = [].tap do |link|
            link << link_to(company_path(company)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_company_path(company)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(company_path(company), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
      companies.count
    end
  
    def total_entries
      10
    end
  
    def companies
      @companies ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @companies = Company.all

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
          companys = companys.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @companies
    end
  
    def order_columns
      %w[
        id
        name
        country
        city
      ]
    end
  
    def search_columns
      %w[
        id
        name
        country
        city
      ]
    end
  
    def months_to_search(search_value)
      months = t('date.month_names').map(&:to_s).map(&:downcase)
      months.each_index.select { |i| months[i].include?(search_value.downcase) }
    end
  end
  