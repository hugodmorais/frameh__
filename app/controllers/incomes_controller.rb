class IncomesController < ApplicationController
    before_action :set_income, only: [:edit, :show, :update, :destroy]
    before_action :set_annual_managements, only: [:new, :create, :edit, :update]
    before_action :set_user_groups, only: [:new, :create, :edit, :update]
    before_action :set_income_categories, only: [:new, :create, :edit, :update]
    before_action :require_logged_in_user
  
    def index
        @incomes = Income.all.paginate(page: params[:page], per_page: 9)
    end
    
    def new
        @income = Income.new
    end

    def edit
    end  

    def create
        @income = Income.new(income_params)
        if @income.save
            flash[:success] = "income was successfully created!"
            redirect_to income_path(@income)
        else
            render 'new'
        end
    end

    def update
        if @income.update(income_params)
            flash[:success] = "income was successfully updated!"
            redirect_to income_path(@income)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @income.destroy

        flash[:danger] = "income was successefully destroy"
        redirect_to incomes_path
    end
    

    private

    def set_income
        @income = Income.find(params[:id])
    end

    def set_annual_managements
        @annual_managements = AnnualManagement.all
    end  

    def set_user_groups
        @user_groups = UserGroup.where(user: current_user)
    end  

    def set_income_categories
        @income_categories = IncomeCategory.all
    end  
    
    def income_params
        params.require(:income).permit!
    end
end