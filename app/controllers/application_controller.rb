class ApplicationController < ActionController::Base

  before_action :set_current_month
  before_action :set_current_annual_management

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def current_user_group(ids)
    @current_user_group ||= UserGroup.find(ids)
  end

  def require_annual_management
    return if Current.annual_management.present?

    redirect_to warning_annual_path
  end

  include SessionsHelper

  private

  def set_current_annual_management
    Current.annual_management = AnnualManagement.find_by(id: session[:frameh_annual_management]) || AnnualManagement.last
  end

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
