class ContractStatusesController < ApplicationController
  before_action :set_contract_status, only: [:edit, :show, :update, :destroy]
  before_action :require_annual_management

  def index
    respond_to do |format|
      format.html
      format.json { render json: ContractStatusesDatatable.new(params, view_context: view_context) }
    end
  end
  
  def new
    @contract_status = ContractStatus.new
  end

  def edit
  end  

  def create
    @contract_status = ContractStatus.new(contract_status_params)
    @contract_status.user = current_user
    if @contract_status.save
      flash[:success] = 'contract_status was successfully created!'
      redirect_to contract_status_path(@contract_status)
    else
      render 'new'
    end
  end

  def update
    if @contract_status.update(contract_status_params)
      flash[:success] = 'contract_status was successfully updated!'
      redirect_to contract_status_path(@contract_status)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @contract_status.destroy

    flash[:danger] = 'contract_status was successefully destroy'
    redirect_to contract_statuses_path
  end

  private

  def set_contract_status
    @contract_status = ContractStatus.find(params[:id])
  end
  
  def contract_status_params
    params.require(:contract_status).permit!
  end
end
