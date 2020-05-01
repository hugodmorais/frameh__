class CurrencyKindsDatatable < ApplicationDatatable
  
  def view_columns
    @view_columns ||= {
      name: { source: "CurrencyKind.name" },
      actions: { source: "CurrencyKind.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    CurrencyKind.by_user(params[:current_user])
  end

  def show_action(record)
    actions = "<a href='/currency_kinds/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/currency_kinds/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/currency_kinds/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
