class SettingsController < ApplicationController
    before_action :set_setting, only: [:edit, :update, :edit]

    def show
    end

    def edit
    end  

    def update
        if @setting.update(setting_params)
            flash[:success] = "setting was successfully updated!"
            redirect_to edit_setting_path(current_user)
        else
            render 'edit'
        end
    end

    private

    def set_setting
        @setting = Setting.find_or_create_by(user_id: current_user)
    end
    
    def setting_params
        params.require(:setting).permit(
            :primary_payments
        )
    end
end
