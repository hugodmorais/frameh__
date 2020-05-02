# == Schema Information
#
# Table name: financial_statements
#
#  id                   :bigint           not null, primary key
#  month                :integer
#  total_balance        :decimal(, )
#  annual_management_id :bigint
#  account_id           :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_financial_statements_on_account_id            (account_id)
#  index_financial_statements_on_annual_management_id  (annual_management_id)
#

class FinancialStatement < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :user
    belongs_to :annual_management
    belongs_to :account
    
    # Delegates
    
    # Constants
    
    # Scopes
    scope :by_user, ->(user) { where(user_id: user) }

    # Callbacks
    
    # Validations
    
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
