class PaymentInstallmentsController < ApplicationController
    before_action :set_payment_installment, only: [:edit, :show, :update, :destroy]
    before_action :require_annual_management
  
    def index
        @payment_installments = PaymentInstallment.all
    end
    
    def new
        @payment_installment = PaymentInstallment.new
    end

    def edit
    end  

    def create
        @payment_installment = PaymentInstallment.new(payment_installment_params)
        @payment_installment.user = current_user
        if @payment_installment.save
            flash[:success] = "payment_installment was successfully created!"
            redirect_to payment_installment_path(@payment_installment)
        else
            render 'new'
        end
    end

    def update
        if @payment_installment.update(payment_installment_params)
            flash[:success] = "payment_installment was successfully updated!"
            redirect_to payment_installment_path(@payment_installment)
        else
            render 'edit'
        end
    end

    def show
    end

    def destroy
        @payment_installment.destroy

        flash[:danger] = "payment_installment was successefully destroy"
        redirect_to payment_installments_path
    end
    

    private

    def set_payment_installment
        @payment_installment = PaymentInstallment.find(params[:id])
    end
    
    def payment_installment_params
        params.require(:payment_installment).permit!
    end
end
