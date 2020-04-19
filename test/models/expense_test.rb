# == Schema Information
#
# Table name: expenses
#
#  id                   :bigint           not null, primary key
#  month                :integer
#  kind                 :integer
#  user_id              :bigint
#  annual_management_id :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_expenses_on_annual_management_id  (annual_management_id)
#  index_expenses_on_user_id               (user_id)
#

require 'test_helper'

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
