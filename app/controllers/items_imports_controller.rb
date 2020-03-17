class ItemsImportsController < ApplicationController

  def new
    @items_import = ItemsImport.new
  end

  def create
    redirect_to expenses_path
  end
end