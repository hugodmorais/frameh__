class ImportJob < ApplicationJob
  queue_as :default

  def perform(import)
    import.execute_job
  rescue StandardError => e
    logger.fatal e
    import.finished_at = Time.current
    import.status = Import::STATUSES.fetch(:with_error)
    import.error_description = I18n.t(:unexpected_error)
    import.error_details = import.error_details_message(e)
    import.save
  end
end
