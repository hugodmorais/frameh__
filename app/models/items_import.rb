class ItemsImport
  include ActiveModel::Model
  require 'roo'

  attr_accessor :file

  def initialize(attributes={})
    attributes.each { |name, value| send("#{name}=", value) }
  end

  def persisted?
    false
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def load_imported_items
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      expense_category = row["Categoria"]
      expense_value = row["Janeiro"]
      ExpenseGroup.create!(expense_category: ExpenseCategory.find_by(name: expense_category), expense_value: expense_value)
      
      Expense.create!(
        month: 9, 
        annual_management: AnnualManagement.last,
        expense_groups_attributes: {"#{Time.now}": {expense_category_id: ExpenseGroup.last.id, expense_value: ExpenseGroup.last.expense_value}}
      )
    end
  end

  def imported_items
    @imported_items ||= load_imported_items
    true
  end

  # def save
  #   if imported_items.map(&:valid?).all?
  #     imported_items.each(&:save!)
  #     true
  #   else
  #     imported_items.each_with_index do |item, index|
  #       item.errors.full_messages.each do |msg|
  #         errors.add :base, "Row #{index + 6}: #{msg}"
  #       end
  #     end
  #     false
  #   end
  # end
end