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

class ContractStatus < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    has_many :contracts
    belongs_to :user

    # Delegates
    
    # Constants

    # Scopes
    scope :by_user, ->(user) { where(user_id: user) }
  
    # Callbacks
    
    # Validations
    validates :name, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def to_s
    end
    
    private
    
    # Callbacks
    
    # Validations
    
    # Instance Private methods
    
end
