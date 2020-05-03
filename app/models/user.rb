# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           default(""), not null
#  name            :string           default(""), not null
#  password_digest :string           default(""), not null
#  admin           :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  include Tokenable
  has_secure_password
  has_one_attached :image
  # Includes

  # Attributes

  # Associations
  has_many :user_groups
  has_many :annual_managements
  has_many :expenses
  has_many :incomes
  has_many :companies
  has_many :expense_categories
  has_many :income_categories
  has_many :payment_installments
  has_many :contract_statuses
  has_many :accounts
  has_one :setting
  has_many :contracts
  
  # Delegates

  # Constants
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  # Validations
  validates :name, presence: true, length: { maximum: 50}
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
                                    format: { with: VALID_EMAIL_REGEX },
                                    uniqueness: { case_sensitive: true }

  # Scopes

  # Callbacks
  before_save { self.email = email.downcase }
  after_save :set_setting_account
  before_create :set_tokens
  
  # Constants Methods

  # Default

  def thumb
    image.variant(resize: '260x180', auto_orient: true)
  end

  private

  def set_tokens
    generate_token(:auth_token)
  end

  def set_setting_account
    Setting.create!(user_id: User.last.id)
  end

end
