class PaymentInstallmentsDatatable < ApplicationDatatable
    delegate :payment_installment_path, to: :@view
    delegate :edit_payment_installment_path, to: :@view
    delegate :show_payment_amount, to: :@view
  
    def valid?
      true
    end
  
    def data
      @payment_installments.map do |payment_installment|
        [].tap do |row|
          row << payment_installment.id
          row << payment_installment.name
          row << payment_installment.months_number
          row << payment_installment.total_value
          row << payment_installment.store_name
          row << payment_installment.deposit_money
          row << show_payment_amount(payment_installment)
          links = [].tap do |link|
            link << link_to(payment_installment_path(payment_installment)) do
              content_tag :i, '', class: 'fa fa-eye'
            end
            link << link_to(edit_payment_installment_path(payment_installment)) do
                content_tag :i, '', class: 'fa fa-edit'
            end
            link << link_to(payment_installment_path(payment_installment), method: :delete, data: { confirm: t(:remove_item, count: 0) }) do
                content_tag :i, '', class: 'fa fa-times'
            end
          end
          row << links.join(' ')
        end
      end
    end
  
    def count
        payment_installments.count
    end
  
    def total_entries
      10
    end
  
    def payment_installments
      @payment_installments ||= fetch_records
    end
  
    def fetch_records
      query = []
      search_values = params[:search][:value] if params[:search].present?  
      @payment_installments = PaymentInstallment.all

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
          payment_installments = payment_installments.where(query.join(' or '), search: Regexp.escape(search_value))
        end
      end
      @payment_installments
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
  