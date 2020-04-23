class FinancialStatementsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      month: { source: "FinancialStatement.month" },
      account: { source: "FinancialStatement.account_id" },
      actions: { source: "FinancialStatement.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        month: record.month,
        account: record.account.name,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    FinancialStatement.all
  end

  def show_action(record)
    actions = "<a href='/financial_statements/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/financial_statements/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/financial_statements/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
  