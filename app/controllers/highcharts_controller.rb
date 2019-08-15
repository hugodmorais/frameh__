class HighchartsController < ApplicationController
    def results_total
        chart = ResultsTotal.new(params)
        @testes = chart.testes
    end

    def results_partial
        chart = ResultsPartialChart.new(params)
        @results_partial = chart.results_partial
    end
end