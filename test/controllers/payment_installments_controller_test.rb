# == Schema Information
#
# Table name: payment_installments
#
#  id                  :bigint           not null, primary key
#  name                :string
#  start_date          :date             not null
#  months_number       :integer
#  total_value         :decimal(, )
#  store_name          :string
#  description         :string
#  deposit_money       :decimal(, )
#  monthly_installment :decimal(, )
#  amount_already_paid :decimal(, )
#  user_id             :bigint
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_payment_installments_on_user_id  (user_id)
#

require 'test_helper'

class PaymentInstallmentsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
end
