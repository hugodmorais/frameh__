# == Schema Information
#
# Table name: currency_kinds
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_currency_kinds_on_user_id  (user_id)
#

class CurrencyKind < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :accounts
    
    # Delegates
    
    # Constants
    
    # Scopes
    scope :by_user, ->(user) { where(user_id: user) }
    
    # Callbacks
    
    # Validations
    validates :name, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
