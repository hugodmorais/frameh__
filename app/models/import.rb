class Import < ApplicationRecord
  # Includes

  # Attributes
  has_one_attached :file

  # Associations
  belongs_to :user, optional: true
  belongs_to :annual_management, optional: true
  has_many :import_errors, dependent: :destroy

  # Delegates

  # Constants
  STATUSES = { pending: 0, executing: 1, finished: 2, with_error: 3 }.freeze
  KINDS = { incomes: 0, expenses: 1 }.freeze

  # Validations
  # validates :file, presence: true

  # Scopes
  scope :including_import_errors, -> { includes(:import_errors).order('import_errors.row_number') }

  # Callbacks
  after_initialize :init, if: :new_record?

  # Constants Methods
  STATUSES.each do |key, value|
    define_method("#{key}?") { status == value }
  end

  # Default

  def kind_desc
    KINDS.key(kind)
  end

  def status_desc
    STATUSES.key(status)
  end

  private

  def init
    self.status ||= STATUSES.fetch(:pending)
  end
end