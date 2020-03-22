class IncomeCategory < ApplicationRecord
    
    # Includes

    # Attributes

    # Associations
    has_many :incomes
    belongs_to :user
    
    # Delegates

    # Constants
    
    # Validations
    validates :name, presence: true, uniqueness: true

    # Scopes    
    scope :by_month, -> { order :month }

    # Callbacks

    # Constants Methods

    # Default    

    private
end
