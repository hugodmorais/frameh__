class Group < ApplicationRecord
     # Includes

    # Attributes

    # Associations
    belongs_to :expense_category
    has_many :expenses, dependent: :nullify
    has_many :expense_groups

    # Delegates

    # Constants

    # Validations

    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
