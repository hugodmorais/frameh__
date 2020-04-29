class CompaniesController < ApplicationController
  before_action :set_company, only: [:edit, :show, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: CompaniesDatatable.new(params, view_context: view_context) }
    end
  end
  
  def new
    @company = Company.new
  end

  def edit
  end  

  def create
    @company = Company.new(company_params)
    @company.user = current_user
    if @company.save
      flash[:success] = "Company was successfully created!"
      redirect_to company_path(@company)
    else
      render 'new'
    end
  end

  def update
    if @company.update(company_params)
      flash[:success] = "Company was successfully updated!"
      redirect_to company_path(@company)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @company.destroy

    flash[:danger] = "Article was successefully destroy"
    redirect_to companies_path
  end
  
  private

  def set_company
    @company = Company.find(params[:id])
  end
  
  def company_params
    params.require(:company).permit!
  end
end