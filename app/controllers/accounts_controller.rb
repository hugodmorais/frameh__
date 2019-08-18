class AccountsController < ApplicationController
    before_action :set_account, only: [:edit, :show, :update, :destroy]
    before_action :set_current_kinds, only: [:new, :create, :edit, :update]
  
    def index
        @accounts = Account.all
    end
    
    def new
        @account = Account.new
    end

    def edit
    end  

    def create
        @account = Account.new(account_params)
        if @account.save
            flash[:success] = "account was successfully created!"
            redirect_to account_path(@account)
        else
            render 'new'
        end
    end

    def update
        if @account.update(account_params)
            flash[:success] = "account was successfully updated!"
            redirect_to account_path(@account)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @account.destroy

        flash[:danger] = "account was successefully destroy"
        redirect_to accounts_path
    end
    

    private

    def set_account
        @account = Account.find(params[:id])
    end

    def set_current_kinds
        @currency_kinds = CurrencyKind.all
    end 
    
    def account_params
        params.require(:account).permit!
    end
end
