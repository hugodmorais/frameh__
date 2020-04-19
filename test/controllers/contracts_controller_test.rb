# == Schema Information
#
# Table name: contracts
#
#  id                 :bigint           not null, primary key
#  name               :string           not null
#  number             :string
#  description        :string
#  start_date         :date             not null
#  end_date           :date
#  job                :boolean
#  contract_status_id :bigint
#  user_group_id      :bigint
#  company_id         :bigint
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_contracts_on_company_id          (company_id)
#  index_contracts_on_contract_status_id  (contract_status_id)
#  index_contracts_on_user_group_id       (user_group_id)
#

require 'test_helper'

class ContractsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
