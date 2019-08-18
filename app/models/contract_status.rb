class ContractStatus < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :contracts

    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    
    # Validations
    validates :key, :name, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def to_s
    end
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
