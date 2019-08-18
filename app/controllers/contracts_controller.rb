class ContractsController < ApplicationController
    before_action :set_contract, only: [:edit, :show, :update, :destroy]
    before_action :set_user_groups, only: [:new, :create, :edit, :update]
    before_action :set_companies, only: [:new, :create, :edit, :update]
    before_action :set_contract_statuses, only: [:new, :create, :edit, :update]
  
    def index
        @contracts = Contract.all
    end
    
    def new
        @contract = Contract.new
    end

    def edit
    end  

    def create
        @contract = Contract.new(contract_params)
        if @contract.save
            flash[:success] = "contract was successfully created!"
            redirect_to contract_path(@contract)
        else
            render 'new'
        end
    end

    def update
        if @contract.update(contract_params)
            flash[:success] = "contract was successfully updated!"
            redirect_to contract_path(@contract)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @contract.destroy

        flash[:danger] = "contract was successefully destroy"
        redirect_to contracts_path
    end
    

    private

    def set_contract
        @contract = Contract.find(params[:id])
    end

    def set_user_groups
        @user_groups = UserGroup.where(user: current_user)
    end  

    def set_companies
        @companies = Company.where(user: current_user)
    end 
    
    def set_contract_statuses
        @contract_statuses = ContractStatus.all
    end 
    
    def contract_params
        params.require(:contract).permit!
    end
end
