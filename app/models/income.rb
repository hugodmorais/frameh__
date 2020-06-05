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

class Income < ApplicationRecord
  # Includes
  include CurrentScopable
  
  # Attributes

  # Associations
  belongs_to :income_category, optional: true
  belongs_to :annual_management
  belongs_to :user_group
  belongs_to :company, optional: true
  belongs_to :user
  
  # Delegates

  # Constants

  # Validations
  validates :income_value, :month, presence: true

  # Scopes   
  scope :in_year, ->(year) { joins(:annual_management).where(annual_managements: { year: year }) }
  scope :result_by_year, ->(user) { where(annual_management: AnnualManagement.where(year: Current.year)).where(user_id: user).sum('income_value') }
  
  # Callbacks

  # Constants Methods

  # Default  
  def to_s
      name
  end
  
  private
end
