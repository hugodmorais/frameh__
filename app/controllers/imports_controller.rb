class ImportsController < ApplicationController
  before_action :set_import, only: %i[destroy download import_errors status]

  def index
    datatable = ImportsDatatable.new(view_context)
    respond_to do |format|
      format.html
      format.json { render json: ImportsDatatable.new(params, view_context: view_context) }
    end
  end

  def show
    @import = Import.including_import_errors.find(params[:id])
  end

  def new
    @import = Import.new
  end

  def create
    @import = Current.annual_management.imports.new(import_params.merge(user: current_user))
    if @import.save_it(import_params[:file])
      redirect_to @import, notice: :created
    else
      render :new
    end
  end

  def destroy
    @import.destroy
    redirect_to imports_path, notice: :destroyed
  end

  def download
    if @import.file.blank?
      redirect_to root_url
    else
      binary = @import.file.download

      # or to create a file
      include ActiveStorage::Downloading
      tempfile = @import.file.download_blob_to_tempfile

      # mime_type = MIME::Types.type_for(@import.file.path).first.content_type
      # send_file @import.file.path, filename: @import.file.original_filename, type: mime_type
    end
  end

  def import_errors
    datatable = ImportErrorsDatatable.new(view_context)
    render json: datatable
  end

  def status
  end

  private

  def set_import
    @import = Import.find(params[:id])
  end

  def import_params
    params.require(:import).permit(:kind, :file)
  end
end
