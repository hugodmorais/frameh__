class DatatablesController < ApplicationController
    def user_groups_table
        datatable = UserGroupsDatatable.new(view_context)
        respond_to do |format|
          format.json { render json: datatable }
        end
    end

    def users_table
        datatable = UsersDatatable.new(view_context)
        respond_to do |format|
          format.json { render json: datatable }
        end
    end
end