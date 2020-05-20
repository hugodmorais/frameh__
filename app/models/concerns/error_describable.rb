module ErrorDescribable
  extend ActiveSupport::Concern

  included do
    def self.error_details_message(error)
      "#{error.message}\n(#{error.class})\n#{Rails.backtrace_cleaner.clean(error.backtrace)&.join("\n")}"
    end
  end

  def error_details_message(error)
    self.class.error_details_message error
  end
end
