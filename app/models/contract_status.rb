class ContractStatus < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :contracts
    belongs_to :user

    # Delegates
    
    # Constants

    # Scopes
    scope :by_user, ->(user) { where(user_id: user.id) }
  
    # Callbacks
    
    # Validations
    validates :name, presence: true

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
