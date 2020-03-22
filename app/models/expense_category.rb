class ExpenseCategory < ApplicationRecord
  # Includes

  # Attributes

  # Associations
  has_many :expense_groups
  
  # Delegates
  
  # Constants
  CATEGORY_KINDS = 
    [
      ["&#xf0f9;", "fas fa-ambulance"], ["&#xf179;", "fab fa-apple"], ["&#xf187;", "fas fa-archive"], ["&#xf069;", "fas fa-asterisk"], 
      ["&#xf1fa;", "fas fa-at"], ["&#xf102;", "fas fa-angle-double-up"], ["&#xf24e;", "fas fa-balance-scale"], 
      ["&#xf19c;", "fas fa-university"], ["&#xf0fc;", "fas fa-beer"], ["&#xf0f3;", "fas fa-bell"], ["&#xf206;", "fas fa-bicycle"], 
      ["&#xf02d;", "fas fa-book"], ["&#xf02e;", "fas fa-bookmark"], ["&#xf0b1;", "fas fa-briefcase"], ["&#xf1ad;", "fas fa-building"], 
      ["&#xf207;", "fas fa-bus"], ["&#xf1b9;", "fas fa-car"], ["&#xf1ae;", "fas fa-child"], ["&#xf0c6;", "fas fa-paperclip"], 
      ["&#xf09d;", "fas fa-credit-card"], ["&#xf06d;", "fas fa-fire"], ["&#xf024;", "fas fa-flag"], ["&#xf06b;", "fas fa-gift"], 
      ["&#xf19d;", "fas fa-graduation-cap"], ["&#xf292;", "fas fa-hashtag"], ["&#xf015;", "fa fas fa-home"], ["&#xf0f8;", "fas fa-hospital"], 
      ["&#xf236;", "fas fa-bed"], ["&#xf05a;", "fas fa-info-circle"], ["&#xf0eb;", "fas fa-lightbulb"], ["&#xf10b;", "fas fa-mobile"], 
      ["&#xf095;", "fas fa-phone"], ["&#xf07a;", "fas fa-shopping-cart"], ["&#xf043;", "fa fas fa-tint"], ["&#xf26c;", "fa fa-tv"], 
      ["&#xf241;", "fas fa-battery-three-quarters"]
    ]
    
  
  # Validations
  validates :name, :icon, presence: true
  validates :name, uniqueness: true
  
  # Scopes    

  # Callbacks

  # Constants Methods

  # Default    

  private
end
