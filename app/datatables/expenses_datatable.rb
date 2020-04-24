class ExpensesDatatable < ApplicationDatatable
  def view_columns
    @view_columns ||= {
      month: { source: "Expense.month" },
      year: { source: "Expense.annual_management_id" },
      actions: { source: "Expense.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        month: record.month,
        year: record.annual_management.year,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Expense.in_year(Current.year)
  end

  def show_action(record)
    actions = "<a href='/expenses/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/expenses/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/expenses/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end