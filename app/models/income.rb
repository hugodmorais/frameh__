class Income < ApplicationRecord
    
  # Includes
  include CurrentScopable
  
  # Attributes

  # Associations
  belongs_to :income_category, optional: true
  belongs_to :annual_management
  belongs_to :user_group
  belongs_to :company, optional: true
  
  # Delegates

  # Constants

  # Validations
  validates :income_value, :month, presence: true

  # Scopes   
  scope :in_month, ->(month) { where month: month } 
  scope :in_year, ->(year) { joins(:annual_management).where(annual_managements: { year: year }) }
  
  # Callbacks

  # Constants Methods

  # Default  
  def to_s
      name
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      income_category = row["Categoria"]
      income_company = row["Empresa"]
      income_user = row["Utilizador"]
      
      (1..12).each do |month|
        income_value = row[I18n.t Date::MONTHNAMES[month]]
        
        next if income_value.blank?
        
        income = Income.new(month: month, annual_management: AnnualManagement.find_by(year: Current.year)) 

        income.user_group = UserGroup.find_by(name: income_user)
        income.company = Company.find_by(name: income_company)
        income.income_category = IncomeCategory.find_by(name: income_category)
        income.income_value = income_value

        income.save!
        
      end
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".xls" then Roo::Excel.new(file.path)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type:"
    end
  end
  
  private
end
