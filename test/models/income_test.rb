# == Schema Information
#
# Table name: incomes
#
#  id                   :bigint           not null, primary key
#  month                :integer          not null
#  kind                 :integer
#  income_value         :decimal(, )      not null
#  comment              :text
#  user_group_id        :bigint
#  company_id           :bigint
#  user_id              :bigint
#  annual_management_id :bigint
#  income_category_id   :bigint
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_incomes_on_annual_management_id  (annual_management_id)
#  index_incomes_on_company_id            (company_id)
#  index_incomes_on_income_category_id    (income_category_id)
#  index_incomes_on_user_group_id         (user_group_id)
#  index_incomes_on_user_id               (user_id)
#

require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
