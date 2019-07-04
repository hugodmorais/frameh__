class Expense < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    belongs_to :expense_category
    belongs_to :annual_management
    belongs_to :user_group
    
    # Delegates

    # Constants

    # Validations

    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
