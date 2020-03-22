class IncomeCategoriesController < ApplicationController
    before_action :set_income_category, only: [:edit, :show, :update, :destroy]
    before_action :require_logged_in_user, :require_annual_management
  
    def index
        @income_categories = IncomeCategory.all.paginate(page: params[:page], per_page: 9)
    end
    
    def new
        @income_category = IncomeCategory.new
    end

    def edit
    end  

    def create
        @income_category = IncomeCategory.new(income_category_params)
        if @income_category.save
            flash[:success] = "income_category was successfully created!"
            redirect_to income_category_path(@income_category)
        else
            render 'new'
        end
    end

    def update
        if @income_category.update(income_category_params)
            flash[:success] = "income_category was successfully updated!"
            redirect_to income_category_path(@income_category)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @income_category.destroy

        flash[:danger] = "income_category was successefully destroy"
        redirect_to income_categories_path
    end
    

    private

    def set_income_category
        @income_category = IncomeCategory.find(params[:id])
    end
    
    def income_category_params
        params.require(:income_category).permit!
    end
end