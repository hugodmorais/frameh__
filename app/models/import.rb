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

  def save_it(file)
    if save
      import_incomes(file)
    else
      false
    end
  end

  def execute_job
    update! started_at: Time.current, status: STATUSES.fetch(:executing)
    ActiveRecord::Base.transaction do
      case kind
      when KINDS.fetch(:incomes)
        import_incomes(file)
      when KINDS.fetch(:expenses)
        import_bsc(user)
      end
    end
    self.status = with_error? ? STATUSES.fetch(:with_error) : STATUSES.fetch(:finished)
    # AquaCache.clear_current_tenant
    update! finished_at: Time.current
  end

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

  def import_incomes(file)
    Imports::IncomesImport.new(import: self, file: file)
  end
end