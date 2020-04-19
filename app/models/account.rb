# == Schema Information
#
# Table name: accounts
#
#  id               :bigint           not null, primary key
#  name             :string
#  main_account     :boolean
#  credit_account   :boolean
#  savings_account  :boolean
#  description      :string
#  country          :string
#  currency_kind_id :bigint
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_accounts_on_currency_kind_id  (currency_kind_id)
#  index_accounts_on_user_id           (user_id)
#

class Account < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :currency_kind
    belongs_to :user
    has_many :financial_statements
    
    # Delegates
    
    # Constants
    
    # Scopes
    scope :by_user, ->(user) { where(user_id: user.id) }

    # Callbacks
    
    # Validations
    validates :name, :country, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
