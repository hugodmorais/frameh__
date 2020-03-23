class User < ApplicationRecord

  has_secure_password
  has_one_attached :image
  # Includes

  # Attributes

  # Associations
  has_many :user_groups
  has_many :annual_managements
  has_many :expenses
  has_many :companies
  has_many :expense_categories
  has_many :income_categories
  has_many :payment_installments
  has_many :contract_statuses
  has_many :accounts
  has_one :setting
  
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
  
  # Constants Methods

  # Default

  def thumb
    image.variant(resize: '260x180', auto_orient: true)
  end

  private

  def set_setting_account
    Setting.create!(user_id: User.last.id)
  end

end
