class ResultsTotal
    attr_accessor :params
    attr_accessor :testes
  
    def initialize(params)
      self.params = params
      data
    end
  
    def valid?
      true
    end
  
    def data
      unless valid?
        self.testes = Income.none
        return false
      end
      self.testes = Income.all
    end
  end
  