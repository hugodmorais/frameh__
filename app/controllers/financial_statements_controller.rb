class FinancialStatementsController < ApplicationController
    before_action :set_financial_statements, only: [:edit, :show, :update, :destroy]
    before_action :set_accounts, only: [:new, :create, :edit, :update]
    before_action :require_annual_management
  
    def index
        @financial_statements = FinancialStatement.all
    end
    
    def new
        @financial_statement = FinancialStatement.new
    end

    def edit
    end  

    def create
        @financial_statement = FinancialStatement.new(financial_statement_params)
        if @financial_statement.save
            flash[:success] = "financial_statement was successfully created!"
            redirect_to financial_statement_path(@financial_statement)
        else
            render 'new'
        end
    end

    def update
        if @financial_statement.update(financial_statement_params)
            flash[:success] = "financial_statement was successfully updated!"
            redirect_to financial_statement_path(@financial_statement)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @financial_statement.destroy

        flash[:danger] = "financial_statement was successefully destroy"
        redirect_to financial_statements_path
    end
    

    private

    def set_financial_statements
        @financial_statement = FinancialStatement.find(params[:id])
    end

    def set_accounts
        @accounts = Account.all
    end  
    
    def financial_statement_params
        params.require(:financial_statement).permit!
    end
end
