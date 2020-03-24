class Expense < ApplicationRecord
  # Includes
  include CurrentScopable
  
  # Attributes

  # Associations
  belongs_to :annual_management
  belongs_to :user
  has_many :expense_groups

  # Delegates
  accepts_nested_attributes_for :expense_groups, allow_destroy: true

  # Constants

  # Validations
  validates :month, :expense_groups, presence: true

  # Scopes    
  scope :in_month, ->(month) { where month: month }
  scope :in_year, ->(year) { joins(:annual_management).where(annual_managements: { year: year }) }

  # Callbacks

  # Constants Methods

  # Default  

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      expense_category = row["Categoria"]
      expense_category_id = ExpenseCategory.find_by(name: expense_category)
      
      (1..12).each do |month|
        expense_value = row[I18n.t Date::MONTHNAMES[month]]
        next if expense_value.blank?
        
        expense = Expense.find_by(month: month, annual_management: AnnualManagement.find_by(year: Current.year))

        if expense.present?                
          expense.expense_groups.create!(
              expense_category: expense_category_id,
              expense_value: expense_value
          )
        else
          Expense.create!(month: month, annual_management: AnnualManagement.find_by(year: Current.year)) do |expense|
              expense.expense_groups_attributes = {"#{Time.now}": {expense_category: expense_category_id, expense_value: expense_value}}
          end
        end
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
