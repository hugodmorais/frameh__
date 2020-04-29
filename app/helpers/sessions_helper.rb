module SessionsHelper
  def current_user=(user)
    @current_user = user
  end

  def current_user
    # To run the find only 1 time use memoization ||=
    @current_user ||= User.find_by(auth_token: session[:auth_token])
  end

  def logged_in?
    current_user.present?
  end
end
