class DashboardController < ApplicationController
    def index
        @user_groups = UserGroup.where(user: current_user)
        @incomes = Income.order(income_value: :desc)
    end

    def results
        @testes = Income.where(annual_management: AnnualManagement.where(year: Time.zone.now.year)).order(month: :desc).group((:month)).sum(:income_value)
        render json: @testes  
    end

    def results_partial
        @results_partial = Income.all
    end

    private

   
end