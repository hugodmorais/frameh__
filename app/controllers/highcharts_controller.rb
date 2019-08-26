class HighchartsController < ApplicationController
    def results_total
        chart = ResultsTotal.new(params)
        @incomes = chart.incomes
        @expenses = chart.expenses
    end

    def results_partial
        chart = ResultsPartialChart.new(params)
        @results_partial = chart.results_partial
        @results_total = chart.results_total
    end
end