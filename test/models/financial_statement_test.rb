# == Schema Information
#
# Table name: financial_statements
#
#  id                   :bigint           not null, primary key
#  month                :integer
#  total_balance        :decimal(, )
#  annual_management_id :bigint
#  account_id           :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_financial_statements_on_account_id            (account_id)
#  index_financial_statements_on_annual_management_id  (annual_management_id)
#

require 'test_helper'

class FinancialStatementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
