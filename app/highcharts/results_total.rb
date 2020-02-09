class ResultsTotal
    attr_accessor :params
    attr_accessor :incomes
    attr_accessor :expenses
  
    def initialize(params)
      self.params = params
      data
    end
  
    def valid?
      true
    end
  
    def data
      unless valid?
        self.incomes = Income.none
        self.expenses = Income.none
        return false
      end
      self.incomes = Income.where(annual_management: AnnualManagement.where(year: Current.year))
      self.expenses = Expense.where(annual_management: AnnualManagement.where(year: Current.year)).includes(:expense_groups)
    end
  end
  