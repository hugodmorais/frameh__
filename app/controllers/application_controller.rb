class ApplicationController < ActionController::Base

  before_action :set_current_month

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_user_group(ids)
    @current_user_group ||= UserGroup.find(ids)
  end

  include SessionsHelper

  private

  def set_current_month
    # return if Current.annual_management.blank?

    Current.month = Time.now.month
  end

  def require_logged_in_user
    unless user_signed_in?
      flash[:danger] = 'Area restrita. Por favor, realize o login'
      redirect_to index_path
    end
  end

end
