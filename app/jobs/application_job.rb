class ApplicationJob < ActiveJob::Base
  def self.perform_later(*args)
    if Rails.application.config.perform_later
      super
    else
      perform_now(*args)
    end
  end
end
