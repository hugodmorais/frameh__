# == Schema Information
#
# Table name: user_groups
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  nif           :string
#  card_identify :string
#  phone         :string
#  comment       :text
#  address       :text
#  genre         :integer
#  birth_date    :datetime
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_user_groups_on_user_id  (user_id)
#

require 'test_helper'

class UserGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
