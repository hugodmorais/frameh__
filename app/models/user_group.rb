class UserGroup < ApplicationRecord
  
  # Includes

  # Attributes

  # Associations
  belongs_to :user
  belongs_to :work_group

  # Delegates

  # Constants
  GENRES = { 'Masculino': 0, 'Feminino': 1 }.freeze

  # Validations
  
  # Scopes

  # Callbacks

  # Constants Methods

  # Default

  def to_s
    return 'Masculino' if genre == 0
    'Feminino'
  end

  private
end
