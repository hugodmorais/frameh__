class PaymentInstallmentsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      name: { source: "PaymentInstallment.name" },
      months_number: { source: "PaymentInstallment.months_number" },
      total_value: { source: "PaymentInstallment.total_value" },
      monthly_installment: { source: "PaymentInstallment.monthly_installment" },
      amount_already_paid: { source: "PaymentInstallment.amount_already_paid" },
      actions: { source: "PaymentInstallment.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        months_number: record.months_number,
        total_value: record.total_value,
        monthly_installment: record.deposit_money,
        amount_already_paid: show_payment_amount(record.amount_already_paid),
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    PaymentInstallment.all
  end

  def show_payment_amount(payment)
    "<span class='label' style='background-color: green'>#{payment}</span>".html_safe
  end

  def show_action(record)
    actions = "<a href='/payment_installments/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/payment_installments/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/payment_installments/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end