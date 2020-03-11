class ExpenseCategory < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    has_many :expense_groups
    
    # Delegates
    
    # Constants
    CATEGORY_KINDS = {
        'abc' => 'ABC',
        'cde' => 'CDE'
      }
    # Validations
    validates :name, presence: true, uniqueness: true
    
    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
