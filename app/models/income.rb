class Income < ApplicationRecord
    
    # Includes
    include CurrentScopable
    
    # Attributes

    # Associations
    belongs_to :income_category
    belongs_to :annual_management
    belongs_to :user_group
    
    # Delegates

    # Constants

    # Validations
    validates :income_value, presence: true

    # Scopes   
    scope :in_month, ->(month) { where month: month } 
    scope :in_year, ->(year) { joins(:annual_management).where(annual_managements: { year: year }) }
    
    # Callbacks

    # Constants Methods

    # Default  
    def to_s
        name
    end
    
    private
end
