class Contact < ApplicationRecord

  # Includes

  # Attributes

  # Associations
  belongs_to :user
  
  # Delegates

  # Constants

  # Validations
  validates :name, presence: true, length: { maximum:50}
  validates :phone, presence: true

  # Scopes

  # Callbacks

  # Constants Methods

  # Default

  private
end
