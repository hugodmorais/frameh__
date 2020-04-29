class SessionsController < ApplicationController
  skip_before_action :require_login

  def new
    redirect_to dashboard_url if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      create_user_session(user)
      redirect_to dashboard_url
    else
      flash[:error] = "login_error"
      redirect_to root_url
    end
  end

  def destroy
    destroy_user_session
    redirect_to root_url
  end
end
