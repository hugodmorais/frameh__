class Income < ApplicationRecord
    
    # Includes

    # Attributes

    # Associations
    belongs_to :annual_management
    belongs_to :user_group
    
    # Delegates

    # Constants
    TYPES = { 'Salario': 0, 'Sub Natal': 1, 'Sub Ferias': 2, 'Premios': 3, 'Outras Receitas': 4 }.freeze

    # Validations

    # Scopes    
    scope :by_month, -> { order :month }

    # Callbacks

    # Constants Methods

    # Default

    def kind_desc
        TYPES.key kind
    end
    

    private
end
