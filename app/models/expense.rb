class Expense < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    belongs_to :annual_management
    belongs_to :user_group
    has_many :expense_groups
    
    # Delegates
    accepts_nested_attributes_for :expense_groups, allow_destroy: true

    # Constants

    # Validations
    validates :month, presence: true

    # Scopes    

    # Callbacks

    # Constants Methods

    # Default  

    private
end
