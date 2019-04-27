class WorksController < ApplicationController
    before_action :set_work, only: [:edit, :show, :update, :destroy]
    before_action :require_logged_in_user
    before_action :require_same_user

    def index
        @works = Work.where(user: current_user).paginate(page: params[:page], per_page: 9)
    end
    
    def new
        @work = Work.new
    end

    def edit
    end  

    def create
        @work = Work.new(work_params)
        @work.user = current_user
        if @work.save
            flash[:success] = "Work was successfully created!"
            redirect_to work_path(@work)
        else
            render 'new'
        end
    end

    def update
    if @work.update(work_params)
        flash[:success] = "Work was successfully updated!"
        redirect_to work_path(@work)
    else
        render 'edit'
    end
    end

    def show
    end

    def destroy
        @work.destroy

        flash[:danger] = "Article was successefully destroy"
        redirect_to works_path
    end
    

    private

    def set_work
        @work = Work.find(params[:id])
    end
    
    def work_params
        params.require(:work).permit!
    end

    def require_same_user
        if current_user != @work&.user
            flash[:danger] = "Somente acesso aos seus ficheiros."
            redirect_to root_path
        end
    end
end