class Contract < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :company
    belongs_to :contract_status
    belongs_to :user_group

    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    
    # Validations
    validates :name, :start_date, :company_id, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def to_s
    end
    
    private
    
    # Callbacks
    def init
    end
    
    # Validations
    
    # Instance Private methods
    
end
