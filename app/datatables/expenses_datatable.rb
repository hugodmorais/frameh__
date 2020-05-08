class ExpensesDatatable < ApplicationDatatable
  def view_columns
    @view_columns ||= {
      year: { source: "Expense.annual_management_id" },
      month: { source: "Expense.month" },
      actions: { source: "Expense.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        year: record.annual_management.year,
        month: I18n.t('date.month_names')[record.month],
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Expense.by_user(params[:current_user]).in_year(Current.year)
  end

  def show_action(record)
    actions = "<a href='/expenses/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/expenses/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/expenses/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end