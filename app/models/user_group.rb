# == Schema Information
#
# Table name: user_groups
#
#  id            :bigint           not null, primary key
#  name          :string           not null
#  nif           :string
#  card_identify :string
#  phone         :string
#  comment       :text
#  address       :text
#  genre         :integer
#  birth_date    :datetime
#  user_id       :bigint
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_user_groups_on_user_id  (user_id)
#

class UserGroup < ApplicationRecord
  
  has_one_attached :image
  # Includes

  # Attributes

  # Associations
  belongs_to :user
  has_many :work_groups
  has_many :incomes
  has_many :contracts
    
  # Delegates

  # Constants
  GENRES = { 'Masculino': 0, 'Feminino': 1 }.freeze

  # Validations
  validates :name, :genre, :birth_date, presence: true

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
