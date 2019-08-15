class AnnualManagement < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    has_many :incomes, dependent: :destroy
    
    # Delegates

    # Constants

    # Validations
    validates :year, presence: true, uniqueness: true
    
    # Scopes    
    scope :by_year, -> { order :year }

    # Callbacks

    # Constants Methods

    # Default

    private
end
