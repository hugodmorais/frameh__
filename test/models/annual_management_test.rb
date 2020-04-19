# == Schema Information
#
# Table name: annual_managements
#
#  id          :bigint           not null, primary key
#  year        :integer          not null
#  description :text
#  user_id     :bigint
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_annual_managements_on_user_id  (user_id)
#

require 'test_helper'

class AnnualManagementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
