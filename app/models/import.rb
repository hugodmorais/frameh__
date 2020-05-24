class Import < ApplicationRecord
  # Includes
  include ErrorDescribable

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
  validates :kind, inclusion: { in: KINDS.values }
  validates :file, presence: true

  # Scopes
  scope :including_import_errors, -> { includes(:import_errors).order('import_errors.row_number') }

  # Callbacks
  after_initialize :init, if: :new_record?

  # Constants Methods
  STATUSES.each do |key, value|
    define_method("#{key}?") { status == value }
  end

  # Default

  def save_it
    if save
      job = ImportJob.perform_later(self)
      update! job_id: job.try(:provider_job_id)
    else
      false
    end
  end

  # Backend method to import pending Import
  def execute_job
    update! started_at: Time.current, status: STATUSES.fetch(:executing)
    ActiveRecord::Base.transaction do
      case kind
      when 0
        import_incomes
      when 1
        execute_remove_client_import
      end
    end
    self.status = STATUSES.fetch(:finished)
    self.finished_at = Time.now
    save!
  end

  def kind_desc
    case KINDS.key(kind)
    when :incomes
      return 'Incomes'
    end
  end

  def status_desc
    STATUSES.key(status)
  end

  private

  def import_incomes
    Imports::IncomesImport.new(import: self).save
  end  

  def init
    self.status ||= STATUSES.fetch(:pending)
  end
end