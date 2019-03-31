class Article < ApplicationRecord
# Includes

  # Attributes

  # Associations
  belongs_to :user
  
  # Delegates

  # Constants

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  validates :user_id, presence: true
  # Scopes

  # Callbacks

  # Constants Methods

  # Default

  private
end
