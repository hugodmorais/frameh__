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

require 'test_helper'

class IncomeCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
