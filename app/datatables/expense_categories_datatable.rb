class ExpenseCategoriesDatatable < ApplicationDatatable
  
  def view_columns
    @view_columns ||= {
      name: { source: "ExpenseCategory.name" },
      primary_payment: { source: "ExpenseCategory.primary_payment" },
      icon: { source: "ExpenseCategory.icon" },
      actions: { source: "ExpenseCategory.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        primary_payment: record.primary_payment? ? "<i class='fa fa-check'></i></a>".html_safe : "<i class='fa fa-times'></i></a>".html_safe,
        icon: "<i class='#{record.icon}'></i></a>".html_safe,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    ExpenseCategory.by_user(params[:current_user])
  end

  def show_action(record)
    actions = "<a href='/expense_categories/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/expense_categories/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/expense_categories/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
