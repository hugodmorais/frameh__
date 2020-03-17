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
            expense = find_by_id(row["id"]) || new
            expense.attributes = row.to_hash.slice(*row.to_hash.keys)
            expense.save!
        end
    end

    def self.open_spreadsheet(file)
        byebug
        case File.extname(file.original_filename)
        when ".xls" then Roo::Excel.new(file.path)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type:"
        end
    end

    private
end
