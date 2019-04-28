class UserGroup < ApplicationRecord
  
  has_one_attached :image
  # Includes

  # Attributes

  # Associations
  belongs_to :user
  has_many :work_groups
  has_many :incomes

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

  def incomes_sum(user)
    Income.where(user_group: user).sum(:income_value)
  end

  def thumb
    image.variant(resize: '50x50', auto_orient: true)
  end

  private
end
