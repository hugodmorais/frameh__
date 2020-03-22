class ExpensesController < ApplicationController
    before_action :set_expense, only: [:edit, :show, :update, :destroy]
    before_action :set_annual_managements, only: [:new, :create, :edit, :update]
    before_action :set_user_groups, only: [:new, :create, :edit, :update]
    before_action :set_expense_categories, only: [:new, :create, :edit, :update]
    before_action :require_logged_in_user, :require_annual_management
  
    def index
        @expenses = Expense.in_year(Current.year)
    end
    
    def new
        @expense = Expense.new
    end

    def edit
    end  

    def create
        @expense = Expense.new(expense_params)
        @expense.user = Current.user
        @expense.annual_management = AnnualManagement.find_by_year(Current.year)
        if @expense.save
            flash[:success] = "expense was successfully created!"
            redirect_to expense_path(@expense)
        else
            render 'new'
        end
    end

    def update
        if @expense.update(expense_params)
            flash[:success] = "expense was successfully updated!"
            redirect_to expense_path(@expense)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @expense.destroy

        flash[:danger] = "expense was successefully destroy"
        redirect_to expenses_path
    end

    def monthly_expenses
        @expenses = Expense.in_current_year.in_month(Current.month)
    end

    def import
        Expense.import(params[:file])
        redirect_to root_url, notice: "Imported"
    end
    
    private

    def set_expense
        @expense = Expense.find(params[:id])
    end

    def set_annual_managements
        @annual_managements = AnnualManagement.all
    end  

    def set_user_groups
        @user_groups = UserGroup.where(user: current_user)
    end  

    def set_expense_categories
        @expense_categories = ExpenseCategory.all
    end  
    
    def expense_params
        params.require(:expense).permit(
            :month,
            :kind,
            :user_group_id,
            :annual_management_id,
            expense_groups_attributes: %i[id expense_category_id expense_value _destroy]
        )
    end
end
