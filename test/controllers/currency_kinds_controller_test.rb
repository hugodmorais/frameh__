# == Schema Information
#
# Table name: currency_kinds
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_currency_kinds_on_user_id  (user_id)
#

require 'test_helper'

class CurrencyKindsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
