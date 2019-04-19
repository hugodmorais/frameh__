class AnnualManagement < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    
    # Delegates

    # Constants

    # Validations

    # Scopes    
    scope :by_year, -> { order :year }

    # Callbacks

    # Constants Methods

    # Default

    private
end
