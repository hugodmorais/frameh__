class Account < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :currency_kind
    has_many :financial_statements
    
    # Delegates
    
    # Constants
    
    # Scopes
    
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
