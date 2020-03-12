class ExpenseCategory < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    has_many :expense_groups
    
    # Delegates
    
    # Constants
    CATEGORY_KINDS = 
        [["&#xf036;", 'fa-align-left'], ["Kroner", "DKK"]]
        
      
    # Validations
    validates :name, presence: true, uniqueness: true
    
    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
