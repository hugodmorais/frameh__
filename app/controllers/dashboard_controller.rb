class DashboardController < ApplicationController
    def index
        @user_groups = UserGroup.where(user: current_user)
    end
end