class AnnualManagement < ApplicationRecord
    # Includes
    include CurrentScopable
    
    # Attributes

    # Associations
    has_many :incomes, dependent: :destroy
    has_many :financial_statements
    belongs_to :users
    
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
