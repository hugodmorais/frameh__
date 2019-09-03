class Current < ActiveSupport::CurrentAttributes
  attribute :user
  attribute :tenant
  attribute :annual_management
  attribute :month

  def year
    annual_management&.year
  end
end
