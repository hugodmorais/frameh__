module CurrentScopable
    extend ActiveSupport::Concern
  
    included do
      scope :in_current_year, -> { in_year(Current.year) }
    end
  end
  