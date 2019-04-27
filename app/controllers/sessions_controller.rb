class SessionsController < ApplicationController

  def new
    redirect_to user_path(current_user) if user_signed_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Email ou palavra-passe invalidos'
      redirect_to root_path
    end
  end

  def destroy
    sign_out
    redirect_to index_path
  end

end
