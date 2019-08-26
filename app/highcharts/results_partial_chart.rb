class ResultsPartialChart
    attr_accessor :params
    attr_accessor :results_partial
    attr_accessor :results_total
  
    def initialize(params)
      self.params = params
      data
    end
  
    def valid?
      true
    end
  
    def data
      unless valid?
        self.results_partial = Income.none
        self.results_total = Expense.none
        return false
      end
      self.results_partial = Income.where(annual_management: AnnualManagement.where(year: Time.zone.now.year))
      self.results_total = Expense.all
    end
  
    private
  
    def sort_hash_values(h)
      h.sort_by(&:last).reverse.to_h
    end
  end
  