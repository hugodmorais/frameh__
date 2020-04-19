# == Schema Information
#
# Table name: settings
#
#  id               :bigint           not null, primary key
#  primary_payments :boolean
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_settings_on_user_id  (user_id)
#

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
