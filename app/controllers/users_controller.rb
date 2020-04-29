class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update, :destroy]
  before_action :require_annual_management

  def index  
    respond_to do |format|
      format.html
      format.json { render json: UserDatatable.new(params, view_context: view_context) }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Usuario cadastrado com sucesso'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      flash[:success] = 'Dados atualizados'
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:danger] = "User was successefully destroy"
    redirect_to users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :password, :image)
  end
end
