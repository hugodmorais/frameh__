class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :require_login
  before_action :set_current_user
  before_action :set_current_month
  before_action :set_current_annual_management

  def create_user_session(user)
    destroy_user_session # Recomended by Rails Guides to clear session after login
    session[:auth_token] = user.auth_token
    self.current_user = user
  end

  def destroy_user_session
    reset_session
    self.current_user = nil
  end

  def require_login
    return if logged_in?

    flash[:error] = 'require_login'
    redirect_to root_url
  end

  def current_user_group(ids)
    @current_user_group ||= UserGroup.find(ids)
  end

  def require_annual_management
    return if Current.annual_management.present? && AnnualManagement.by_user(current_user).any?

    redirect_to warning_annual_path
  end

  private

  def set_current_user
    Current.user = User.find_by(auth_token: session[:auth_token])
  end

  def set_current_annual_management
    Current.annual_management = AnnualManagement.find_by(id: session[:frameh_annual_management]) ||
                                AnnualManagement.last
  end

  def set_current_month
    # return if Current.annual_management.blank?

    Current.month = Time.now.month
  end
end
