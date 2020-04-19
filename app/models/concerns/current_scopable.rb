module CurrentScopable
    extend ActiveSupport::Concern
  
    included do
      scope :current_year, -> { in_year(Current.year) }
    end
  end
  