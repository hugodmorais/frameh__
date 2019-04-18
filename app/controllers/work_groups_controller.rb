class WorkGroupsController < ApplicationController
    before_action :set_work_group, only: [:edit, :show, :update, :destroy]
    before_action :set_user_groups, only: [:new, :create, :edit, :update]
    before_action :set_works, only: [:new, :create, :edit, :update]
  
    def index
        @work_groups = WorkGroup.all.paginate(page: params[:page], per_page: 9)
        @user_groups = UserGroup.all
    end
    
    def new
        @work_group = WorkGroup.new
    end

    def edit
    end  

    def create
        @work_group = WorkGroup.new(work_group_params)
        if @work_group.save
            flash[:success] = "Work Group was successfully created!"
            redirect_to work_path(@work_group)
        else
            render 'new'
        end
    end

    def update
    if @work_group.update(work_group_params)
        flash[:success] = "Work Group was successfully updated!"
        redirect_to work_path(@work_group)
    else
        render 'edit'
    end
    end

    def show
    end

    def destroy
        @work_group.destroy

        flash[:danger] = "Work Group was successefully destroy"
        redirect_to work_groups_path
    end
    

    private

    def set_work_group
        @work_group = Work.find(params[:id])
    end

    def set_user_groups
        @user_groups = UserGroup.all
    end  
    
    def set_works
        @works = Work.all
    end  
    
    def work_group_params
        params.require(:work).permit!
    end
end