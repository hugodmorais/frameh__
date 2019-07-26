class User < ApplicationRecord

  has_secure_password
  has_one_attached :image
  # Includes

  # Attributes

  # Associations
  has_many :contacts
  has_many :articles
  has_many :user_groups
  has_many :companies
  
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
  
  # Constants Methods

  # Default

  def thumb
    image.variant(resize: '260x180', auto_orient: true)
  end
  
  private
end
