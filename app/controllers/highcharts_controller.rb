class HighchartsController < ApplicationController
    def results_total
        chart = ResultsTotal.new(params)
        @testes = chart.testes
    end
end