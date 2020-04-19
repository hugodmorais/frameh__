# == Schema Information
#
# Table name: settings
#
#  id               :bigint           not null, primary key
#  primary_payments :boolean
#  user_id          :bigint
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_settings_on_user_id  (user_id)
#

require 'test_helper'

class SettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
