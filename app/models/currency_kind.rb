class CurrencyKind < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :accounts
    
    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    
    # Validations
    validates :key, :name, presence: true
    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
