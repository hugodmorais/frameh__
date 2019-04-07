class UsersController < ApplicationController
  before_action :require_logged_in_user, only: [:edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
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
      redirect_to contacts_url
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

  def user_params
    params.require(:user).permit(:email, :name, :password, :image)
  end
end
