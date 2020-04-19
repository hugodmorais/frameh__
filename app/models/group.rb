# == Schema Information
#
# Table name: groups
#
#  id                  :bigint           not null, primary key
#  expense_category_id :bigint
#  expense_value       :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_groups_on_expense_category_id  (expense_category_id)
#

class Group < ApplicationRecord
     # Includes

    # Attributes

    # Associations
    belongs_to :expense_category
    has_many :expenses, dependent: :nullify
    has_many :expense_groups

    # Delegates

    # Constants

    # Validations

    # Scopes    

    # Callbacks

    # Constants Methods

    # Default    

    private
end
