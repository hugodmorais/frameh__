class Expense < ApplicationRecord
    # Includes
    include CurrentScopable
    
    # Attributes

    # Associations
    belongs_to :annual_management
    belongs_to :user
    has_many :expense_groups
    
    # Delegates
    accepts_nested_attributes_for :expense_groups, allow_destroy: true

    # Constants

    # Validations
    validates :month, :expense_groups, presence: true

    # Scopes    
    scope :in_month, ->(month) { where month: month }
    scope :in_year, ->(year) { joins(:annual_management).where(annual_managements: { year: year }) }

    # Callbacks

    # Constants Methods

    # Default  

    private
end
