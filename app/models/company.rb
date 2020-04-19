# == Schema Information
#
# Table name: companies
#
#  id         :bigint           not null, primary key
#  name       :string           default(""), not null
#  country    :string           default(""), not null
#  city       :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_companies_on_user_id  (user_id)
#

class Company < ApplicationRecord
    # Includes

    # Attributes

    # Associations
    has_many :work_groups
    has_many :contracts
    has_many :incomes
    belongs_to :user
    
    # Delegates

    # Constants

    # Validations
    validates :name, :city, :country, presence: true

    # Scopes

    # Callbacks

    # Constants Methods

    # Default

    private
end
