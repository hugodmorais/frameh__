class Imports::IncomesImport < Imports::ApplicationImport
  INCOMES_SHEET = 'Receitas'.freeze

  attr_accessor :annual_management

  private

  def import_data
    # Import tabs excel
    Rails.logger.info { 'Start importing Incomes...' }
    import_incomes
  end

  def import_incomes
    byebug
    spreadsheet.default_sheet = INCOMES_SHEET
    header = spreadsheet.row(1)
    byebug
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      income_category = row["Categoria"]
      income_company = row["Empresa"]
      income_user = row["Utilizador"]
      
      (1..12).each do |month|
        income_value = row[I18n.t Date::MONTHNAMES[month]]
        
        next if income_value.blank?
        
        income = Income.new(month: month, annual_management: AnnualManagement.find_by(year: Current.year)) 
        income.user_id = user.id
        income.user_group = UserGroup.find_by(name: income_user)
        income.company = Company.find_by(name: income_company)
        income.income_category = IncomeCategory.find_by(name: income_category)
        income.income_value = income_value

        income.save!
        
      end
    end
  end

  def open_spreadsheet(import)
    case File.extname(import.file.filename)
    when ".xls" then Roo::Excel.new(import.path)
    when ".xlsx" then Roo::Excelx.new(import.path)
    else raise "Unknown file type:"
    end
  end
end
