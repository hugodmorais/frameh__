class DashboardController < ApplicationController
    def index
        @user_groups = UserGroup.where(user: current_user)
        @incomes = Income.order(income_value: :desc)
        @payment_installments = PaymentInstallment.all
        # @expenses = Expense.where(annual_management: AnnualManagement.where(year: Time.zone.now.year), month: Time.now.month)
        @expenses = Expense.last.expense_groups
        @monthly_expenses_by_index = Expense.in_current_year.in_month(Current.month)
    end

    private

end