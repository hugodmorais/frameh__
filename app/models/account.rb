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
