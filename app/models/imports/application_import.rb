class Imports::ApplicationImport
  attr_accessor :import
  attr_accessor :spreadsheet

  def valid?
    validation_result = false
    if import.file.present?
      open_spreadsheet
      
      if spreadsheet.nil?
        import.error_description = I18n.t('imports.file_not_valid')
      else
        validation_result = template_ok?
      end
    else
      import.error_description = I18n.t('imports.file_not_presented')
    end
    # Save import
    import.save!

    validation_result
  end

  def save
    # Guard Clause
    return false unless valid?

    # Do import method
    import_data

    # Save import
    import.save!
  end

  def build_import_error(row_number, description)
    import.import_errors.build sheet: spreadsheet.default_sheet, row_number: row_number, description: description
  end

  private

  def open_spreadsheet
    case File.extname(@file)
    when '.xls' then self.spreadsheet = Roo::Excel.new(@file)
    when '.xlsx' then self.spreadsheet = Roo::Excelx.new(@file)
    end
  end
end
