# == Schema Information
#
# Table name: income_categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_income_categories_on_user_id  (user_id)
#

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
    scope :by_user, ->(user) { where(user_id: user.id) }

    # Callbacks

    # Constants Methods

    # Default    

    private
end
