class IncomesDatatable < ApplicationDatatable
  
  def view_columns
    @view_columns ||= {
      month: { source: "Income.month" },
      kind: { source: "Income.income_category_id" },
      income_value: { source: "Income.income_value" },
      actions: { source: "Income.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        month: record.month,
        kind: record.income_category.name,
        income_value: record.income_value,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Income.in_year(Current.year)
  end

  def show_action(record)
    actions = "<a href='/incomes/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/incomes/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/incomes/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end