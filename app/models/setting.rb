class Setting < ApplicationRecord
     # Includes

    # Attributes

    # Associations
    belongs_to :user
    
    # Delegates

    # Constants
    STATUSES = { inactive: 0, active: 1 }.freeze

    # Validations

    # Scopes    

    # Callbacks
    after_initialize :init

    # Constants Methods

    # Default    

    private

    def init
        self.primary_payments ||= STATUSES.fetch(:active)
    end
end
