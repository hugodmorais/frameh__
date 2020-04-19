# == Schema Information
#
# Table name: work_groups
#
#  id            :bigint           not null, primary key
#  start_at      :datetime
#  end_at        :datetime
#  company_id    :bigint
#  user_group_id :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_work_groups_on_company_id     (company_id)
#  index_work_groups_on_user_group_id  (user_group_id)
#

class WorkGroup < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    belongs_to :user_group
    belongs_to :company
    
    # Delegates
    
    # Constants

    # Validations
    
    # Scopes

    # Callbacks

    # Constants Methods

    # Default

    private
end
