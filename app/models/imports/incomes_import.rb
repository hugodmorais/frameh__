class Imports::IncomesImport
  attr_accessor :import
  attr_accessor :file
  attr_accessor :spreadsheet

  def initialize(attributes = {})
    @import = attributes[:import]
    @user = attributes[:import].user_id
    @file = attributes[:file]

    execute
  end

  def execute
    import
  end

  private

  def import
    spreadsheet = open_spreadsheet
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
        income.user_id = @user
        income.user_group = UserGroup.find_by(name: income_user)
        income.company = Company.find_by(name: income_company)
        income.income_category = IncomeCategory.find_by(name: income_category)
        income.income_value = income_value

        income.save!
        
      end
    end
  end

  def open_spreadsheet
    case File.extname(@file)
    when ".xls" then Roo::Excel.new(@file)
    when ".xlsx" then Roo::Excelx.new(@file)
    else raise "Unknown filename type:"
    end
  end
end
