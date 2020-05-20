class Imports::IncomesImport < Imports::ApplicationImport

  private

  def template_ok?
    incomes_ok?
  end

  def missing_columns_description(missing_columns)
    "#{spreadsheet.default_sheet} - #{I18n.t('imports.missing_columns')} #{missing_columns.join(', ')}."
  end

  def incomes_ok?
    true
  #   spreadsheet.default_sheet = STICKERS_SHEET
  #   header = spreadsheet.row(1)
  #   expected_columns = [
  #     'Nome',
  #     'Código',
  #     'Cor',
  #     'Posição Dashboard'
  #   ].freeze
  #   missing_columns = expected_columns - header
  #   if missing_columns.any?
  #     import.error_description = missing_columns_description(missing_columns)
  #     return false
  #   end
  #   true
  # rescue StandardError => e
  #   import.error_description = "#{I18n.t('imports.sheet_error')} #{STICKERS_SHEET}."
  #   import.error_details = error_details_message(e)
  #   Rollbar.critical "#{import.error_description}: #{import.error_details}"
  #   false
  end

  def import_data
    Rails.logger.info { 'Start importing Incomes...' }
    import_incomes
  end

  def import_incomes
    spreadsheet.default_sheet = 'Receitas'
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row.to_i).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      import_income_row(row, i)
    end
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|
    #   row = Hash[[header, spreadsheet.row(i)].transpose]
    #   income_category = row['Categoria']
    #   income_company = row['Empresa']
    #   income_user = row['Utilizador']

    #   (1..12).each do |month|
    #     income_value = row[I18n.t Date::MONTHNAMES[month]]

    #     next if income_value.blank?
        
    #     income = Income.new(month: month, annual_management: AnnualManagement.find_by(year: Current.year)) 
    #     income.user_id = @user
    #     income.user_group = UserGroup.find_by(name: income_user)
    #     income.company = Company.find_by(name: income_company)
    #     income.income_category = IncomeCategory.find_by(name: income_category)
    #     income.income_value = income_value

    #     income.save!
    #   end
    # end
  end

  def import_income_row(row, index)
    income_category = row['Categoria']
    income_company = row['Empresa']
    income_user = row['Utilizador']

    (1..12).each do |month|
      income_value = row[I18n.t Date::MONTHNAMES[month]]

      next if income_value.blank?
      
      income = Income.new(month: month, annual_management: AnnualManagement.find_by(year: Current.year)) 
      income.user_id = @user
      income.user_group = UserGroup.find_by(name: income_user)
      income.company = Company.find_by(name: income_company)
      income.income_category = IncomeCategory.find_by(name: income_category)
      income.income_value = income_value
      byebug
      income.save
    end
    
    build_import_error index, income.errors.full_messages.first
    import.error_description = I18n.t('imports.import_incomplete')
    false
  end
end