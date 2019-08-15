class ResultsPartialChart
    attr_accessor :params
    attr_accessor :results_partial
  
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
        return false
      end
      self.results_partial = Income.all
    end
  
    private
  
    def sort_hash_values(h)
      h.sort_by(&:last).reverse.to_h
    end
  end
  