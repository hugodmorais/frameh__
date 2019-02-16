class ApplicationController < ActionController::Base


  include SessionsHelper

  private

    def require_logged_in_user
      unless user_signed_in?
        flash[:danger] = 'Area restrita. Por favor, realize o login'
        redirect_to entrar_path
      end
    end

end
