class AnnualManagementsController < ApplicationController
    before_action :set_annual_management, only: [:edit, :show, :update, :destroy, :switch]
  
    def index
        @annual_managements = AnnualManagement.all.by_year
    end
    
    def new
        @annual_management = AnnualManagement.new
    end

    def edit
    end  

    def create
        @annual_management = AnnualManagement.new(annual_management_params)
        if @annual_management.save
            flash[:success] = "annual_management was successfully created!"
            redirect_to annual_management_path(@annual_management)
        else
            render 'new'
        end
    end

    def update
        if @annual_management.update(annual_management_params)
            flash[:success] = "annual_management was successfully updated!"
            redirect_to annual_management_path(@annual_management)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @annual_management.destroy
        flash[:danger] = "annual_management was successefully destroy"
        redirect_to annual_managements_path
    end

    def switch
        session[:frameh_annual_management] = @annual_management.id
        redirect_to dashboard_path
    end
    
    private

    def set_annual_management
        @annual_management = AnnualManagement.find(params[:id])
    end
    
    def annual_management_params
        params.require(:annual_management).permit!
    end
end