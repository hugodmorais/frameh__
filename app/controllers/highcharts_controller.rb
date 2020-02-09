class HighchartsController < ApplicationController
    def results_total
        chart = ResultsTotal.new(params)
        @incomes = chart.incomes
        @expenses = chart.expenses
    end
end
