module PaymentInstallmentsHelper
    def show_payment_amount(payment)
        content_tag :span, payment.amount_already_paid, class: 'label', style: "background-color: green"
    end
end
