class PaymentInstallment < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :user
    
    # Constants
    
    # Scopes
    
    # Callbacks
    after_initialize :calculate_monthly_installment
    after_initialize :number_of_months

    # Validations
    
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def to_s
    end

    def percentage_calculate(total, partial)
        return unless total.present? || partial.present?
        puts total
        puts partial
        value = ((partial * 100 / total)/100)
        return value
    end

    def number_of_months
        return unless start_date?

        (((Date.today - start_date).to_f)/30.1).round
    end
 
    def calculate_monthly_installment
        return if self.number_of_months.nil?
        self.amount_already_paid = (number_of_months * deposit_money) + monthly_installment 
    end

    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
