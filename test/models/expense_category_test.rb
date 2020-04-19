# == Schema Information
#
# Table name: expense_categories
#
#  id              :bigint           not null, primary key
#  name            :string
#  icon            :string
#  primary_payment :boolean          default(FALSE)
#  user_id         :bigint
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_expense_categories_on_user_id  (user_id)
#

require 'test_helper'

class ExpenseCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
