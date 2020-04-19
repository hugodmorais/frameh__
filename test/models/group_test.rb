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

require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
