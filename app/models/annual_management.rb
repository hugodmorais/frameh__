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

class AnnualManagement < ApplicationRecord
    # Includes
    include CurrentScopable
    
    # Attributes

    # Associations
    has_many :incomes, dependent: :destroy
    has_many :financial_statements
    belongs_to :users
    has_many :imports, dependent: :nullify
    
    # Delegates

    # Constants

    # Validations
    validates :year, presence: true
    
    # Scopes    
    scope :by_user, ->(user) { where(user_id: user) }

    # Callbacks

    # Constants Methods

    # Default

    private
end
