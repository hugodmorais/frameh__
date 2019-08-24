class DashboardController < ApplicationController
    def index
        @user_groups = UserGroup.where(user: current_user)
        @incomes = Income.order(income_value: :desc)
        @payment_installments = PaymentInstallment.all
    end

    private

end