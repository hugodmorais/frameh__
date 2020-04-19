# == Schema Information
#
# Table name: expense_groups
#
#  id                  :bigint           not null, primary key
#  expense_value       :integer
#  status              :boolean          default(FALSE)
#  expense_id          :bigint
#  group_id            :bigint
#  expense_category_id :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_expense_groups_on_expense_category_id  (expense_category_id)
#  index_expense_groups_on_expense_id           (expense_id)
#  index_expense_groups_on_group_id             (group_id)
#

class ExpenseGroup < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    belongs_to :expense
    belongs_to :group
    belongs_to :expense_category

    # Delegates

    # Constants

    # Validations
    validates :expense_value, :expense_category, presence: true
    
    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
