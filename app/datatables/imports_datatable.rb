class ImportsDatatable < ApplicationDatatable
  def view_columns
    @view_columns ||= {
      id: { source: "Import.id" },
      started_at: { source: "Import.started_at" },
      finished_at: { source: "Import.finished_at" },
      actions: { source: "Income.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        id: record.id,
        started_at: record.started_at,
        finished_at: record.finished_at,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Import.all
  end

  def show_action(record)
    actions = "<a href='/imports/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/imports/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/imports/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end