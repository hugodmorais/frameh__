class ExpensesController < ApplicationController
    before_action :set_expense, only: [:edit, :show, :update, :destroy]
    before_action :set_annual_managements, only: [:new, :create, :edit, :update]
    before_action :set_user_groups, only: [:new, :create, :edit, :update]
    before_action :set_expense_categories, only: [:new, :create, :edit, :update]
    before_action :require_logged_in_user
  
    def index
        @expenses = []
        5.times do
            @expenses = Expense.all.paginate(page: params[:page], per_page: 9)
        end
    end
    
    def new
        @expense = Expense.new
    end

    def edit
    end  

    def create
        @expense = Expense.new(expense_params)
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
        redirect_to expense_path
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
