class CompaniesController < ApplicationController
    before_action :set_company, only: [:edit, :show, :update, :destroy]
    before_action :require_logged_in_user

    def index
        @companies = Company.where(user: current_user).paginate(page: params[:page], per_page: 9)
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