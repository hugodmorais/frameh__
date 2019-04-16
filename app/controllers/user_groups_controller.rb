class UserGroupsController < ApplicationController
    before_action :set_user_groups, only: [:edit, :show, :update, :destroy]
  
    def index
      @user_groups = UserGroup.where(user: current_user).paginate(page: params[:page], per_page: 9)
    end
    
    def new
      @user_group = UserGroup.new
    end
  
    def edit
    end  
  
    def create
      @user_group = UserGroup.new(user_group_params)
      @user_group.user = current_user
      if @user_group.save
        flash[:success] = "UserGroup was successfully created!"
        redirect_to user_group_path(@user_group)
      else
        render 'new'
      end
    end
  
    def update
      if @user_group.update(user_group_params)
        flash[:success] = "UserGroup was successfully updated!"
        redirect_to user_group_path(@user_group)
      else
        render 'edit'
      end
    end
  
    def show
    end
  
    def destroy
      @user_group.destroy
  
      flash[:danger] = "UserGroup was successefully destroy"
      redirect_to user_groups_path
    end
    
  
    private
  
    def set_user_groups
      @user_group = UserGroup.find(params[:id])
    end
    
  
    def user_group_params
      params.require(:user_group).permit!
    end
end
  