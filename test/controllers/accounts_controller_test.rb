# == Schema Information
#
# Table name: accounts
#
#  id               :bigint           not null, primary key
#  name             :string
#  main_account     :boolean
#  credit_account   :boolean
#  savings_account  :boolean
#  description      :string
#  country          :string
#  currency_kind_id :bigint
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_accounts_on_currency_kind_id  (currency_kind_id)
#  index_accounts_on_user_id           (user_id)
#

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
