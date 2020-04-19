class AnnualManagementsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      year: { source: "AnnualManagement.year" },
      description: { source: "AnnualManagement.description" },
      actions: { source: "AnnualManagement.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        year: record.year,
        description: record.description,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    AnnualManagement.by_user
  end

  def show_action(record)
    actions = "<a href='/annual_managements/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/annual_managements/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/annual_managements/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
