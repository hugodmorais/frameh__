class ExpenseGroup < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    belongs_to :expense
    belongs_to :group
    belongs_to :expense_category

    # Delegates

    # Constants

    # Validations
    validates :expense_value, :expense_category, presence: true
    
    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
