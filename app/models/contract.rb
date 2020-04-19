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

class Contract < ApplicationRecord
    
    # Includes
    
    # Attributes
    
    # Associations
    belongs_to :company
    belongs_to :contract_status
    belongs_to :user_group, optional: true

    # Delegates
    
    # Constants
    
    # Scopes
    
    # Callbacks
    
    # Validations
    validates :name, :start_date, :company_id, presence: true

    # Constants Methods
    
    # Class methods
    
    # Instance Public methods
    def to_s
    end
    
    private
    
    # Callbacks
    def init
    end
    
    # Validations
    
    # Instance Private methods
    
end
