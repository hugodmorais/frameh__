class ContractStatus < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :contracts

    # Delegates
    
    # Constants
    ACTIVE_STATUS_KEY = 'active'.freeze
    INACTIVE_STATUS_KEY = 'inactive'.freeze
    PENDING_STATUS_KEY = 'pending'.freeze
    CANCELED_STATUS_KEY = 'canceled'.freeze

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
