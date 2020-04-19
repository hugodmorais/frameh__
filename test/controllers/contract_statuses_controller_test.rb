# == Schema Information
#
# Table name: contract_statuses
#
#  id         :bigint           not null, primary key
#  name       :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_contract_statuses_on_user_id  (user_id)
#

require 'test_helper'

class ContractStatusesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
