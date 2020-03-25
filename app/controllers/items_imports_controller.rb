class ItemsImportsController < ApplicationController

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    redirect_to expenses_path
  end
end