class CurrencyKindsController < ApplicationController
  before_action :set_currency_kinds, only: [:edit, :show, :update, :destroy]
  before_action :require_annual_management

  def index
    respond_to do |format|
      format.html
      format.json { render json: CurrencyKindsDatatable.new(params, view_context: view_context) }
    end
  end
  
  def new
    @currency_kind = CurrencyKind.new
  end

  def edit
  end  

  def create
    @currency_kind = CurrencyKind.new(currency_kind_params)
    if @currency_kind.save
      flash[:success] = 'currency_kind was successfully created!'
      redirect_to currency_kind_path(@currency_kind)
    else
      render 'new'
    end
  end

  def update
    if @currency_kind.update(currency_kind_params)
      flash[:success] = 'currency_kind was successfully updated!'
      redirect_to currency_kind_path(@currency_kind)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @currency_kind.destroy

    flash[:danger] = 'currency_kind was successefully destroy'
    redirect_to currency_kinds_path
  end
  

  private

  def set_currency_kinds
    @currency_kind = CurrencyKind.find(params[:id])
  end
  
  def currency_kind_params
    params.require(:currency_kind).permit!
  end
end
