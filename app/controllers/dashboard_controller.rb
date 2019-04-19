class DashboardController < ApplicationController
    def index
        @user_groups = UserGroup.all
    end
end