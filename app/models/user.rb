class User < ApplicationRecord

  has_secure_password

  # Includes

  # Attributes

  # Associations
  has_many :contacts
  
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

  # Constants Methods

  # Default

  private
end
