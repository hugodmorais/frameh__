class ExpenseCategory < ApplicationRecord
  # Includes

  # Attributes

  # Associations
  has_many :expense_groups
  
  # Delegates
  
  # Constants
  CATEGORY_KINDS = 
    [
      ["&#xf105;", 'fa-angle-right'], ["&#xf0f9;", "fa-ambulance"], ["&#xf179;", "fa-apple"], ["&#xf187;", "fa-archive"], 
      ["&#xf069;", "fa-asterisk"], ["&#xf1fa;", "fa-at"], ["&#xf102;", "fa-angle-double-up"], ["&#xf24e;", "fa-balance-scale"], 
      ["&#xf19c;", "fa-bank"], ["&#xf0fc;", "fa-beer"], ["&#xf0f3;", "fa-bell"], ["&#xf206;", "fa-bicycle"], 
      ["&#xf02d;", "fa-book"], ["&#xf02e;", "fa-bookmark"], ["&#xf0b1;", "fa-briefcase"], ["&#xf1ad;", "fa-building"], 
      ["&#xf207;", "fa-bus"], ["&#xf1b9;", "fa-car"], ["&#xf1ae;", "fa-child"], ["&#xf0c6;", "fa-paperclip"], 
      ["&#xf09d;", "fa-credit-card"], ["&#xf06d;", "fa-fire"], ["&#xf024;", "fa-flag"], ["&#xf06b;", "fa-gift"], 
      ["&#xf19d;", "fa-graduation-cap"], ["&#xf292;", "fa-hashtag"], ["&#xf015;", "fas fa-home"], ["&#xf0f8;", "fa-hospital"], 
      ["&#xf236;", "fa-hotel"], ["&#xf05a;", "fa-info-circle"], ["&#xf0eb;", "fa-lightbulb"], ["&#xf10b;", "fas fa-mobile"], 
      ["&#xf095;", "fa-phone"], ["&#xf07a;", "fa-shopping-cart"], ["&#xf043;", "fas fa-tint"], ["&#xf26c;", "fa-tv"], 
      ["&#xf241;", "fas fa-battery-three-quarters"]
    ]
    
  
  # Validations
  validates :name, presence: true, uniqueness: true
  
  # Scopes    

  # Callbacks

  # Constants Methods

  # Default    

  private
end
