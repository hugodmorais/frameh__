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
    
    def annual_managements_table
      datatable = AnnualManagementsDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def income_categories
      datatable = IncomeCategoriesDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def expense_categories
      datatable = ExpenseCategoriesDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def incomes
      datatable = IncomesDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def expenses
      datatable = ExpensesDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def companies
      datatable = CompaniesDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def contract_statuses
      datatable = ContractStatusesDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def contracts
      datatable = ContractsDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def currency_kinds
      datatable = CurrencyKindsDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def accounts
      datatable = AccountsDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end

    def financial_statements
      datatable = FinancialStatementsDatatable.new(view_context)
      respond_to do |format|
        format.json { render json: datatable }
      end
    end
end