class ExpenseCategoriesController < ApplicationController
  before_action :set_expense_category, only: [:edit, :show, :update, :destroy]
  before_action :require_logged_in_user, :require_annual_management

  def index
    respond_to do |format|
      format.html
      format.json { render json: ExpenseCategoriesDatatable.new(params, view_context: view_context) }
    end
  end
  
  def new
    @expense_category = ExpenseCategory.new
  end

  def edit
  end  

  def create
    @expense_category = ExpenseCategory.new(expense_category_params)
    @expense_category.user = current_user
    if @expense_category.save
      flash[:success] = "expense_category was successfully created!"
      redirect_to expense_category_path(@expense_category)
    else
      render 'new'
    end
  end

  def update
    if @expense_category.update(expense_category_params)
      flash[:success] = "expense_category was successfully updated!"
      redirect_to expense_category_path(@expense_category)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @expense_category.destroy

    flash[:danger] = "expense_category was successefully destroy"
    redirect_to expense_categories_path
  end
  
  private

  def set_expense_category
    @expense_category = ExpenseCategory.find(params[:id])
  end
  
  def expense_category_params
    params.require(:expense_category).permit!
  end
end
