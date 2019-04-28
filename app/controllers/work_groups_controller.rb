class WorkGroupsController < ApplicationController
    before_action :set_work_group, only: [:edit, :show, :update, :destroy]
    before_action :set_user_groups, only: [:new, :create, :edit, :update]
    before_action :set_works, only: [:new, :create, :edit, :update]
    before_action :require_logged_in_user
    
    def index
        @user_groups = UserGroup.all
        @work_groups = WorkGroup.where(user_group: params[:c]).paginate(page: params[:page], per_page: 9)
    end
    
    def new
        @work_group = WorkGroup.new
    end

    def edit
    end  

    def create
        @work_group = WorkGroup.new(work_group_params)
        c = @work_group.user_group_id
        if @work_group.save
            flash[:success] = "Work Group was successfully created!"
            redirect_to controller: 'work_groups', action: 'index', c: c
        else
            render 'new'
        end
    end

    def update
        c = @work_group.user_group_id
        if @work_group.update(work_group_params)
            flash[:success] = "Work Group was successfully updated!"
            redirect_to controller: 'work_groups', action: 'index', c: c
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        c = @work_group.user_group_id
        @work_group.destroy

        flash[:danger] = "Work Group was successefully destroy"
        redirect_to controller: 'work_groups', action: 'index', c: c
    end
    

    private

    def set_work_group
        @work_group = WorkGroup.find(params[:id])
    end

    def set_user_groups
        @user_groups = UserGroup.where(user: current_user)
    end  
    
    def set_works
        @works = Work.where(user: current_user)
    end  
    
    def work_group_params
        params.require(:work_group).permit!
    end
end