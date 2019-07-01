class Income < ApplicationRecord
    
    # Includes

    # Attributes

    # Associations
    belongs_to :income_category
    belongs_to :annual_management
    belongs_to :user_group
    
    # Delegates

    # Constants

    # Validations

    # Scopes    
    scope :in_year, ->(year) { where year: year }
    
    # Callbacks

    # Constants Methods

    # Default  
    def to_s
        name
    end
    
    private
end
