class CompaniesDatatable < ApplicationDatatable
  def view_columns
    @view_columns ||= {
      name: { source: "Company.name" },
      city: { source: "Company.city" },
      country: { source: "Company.country" },
      actions: { source: "Company.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        city: record.city,
        country: record.country,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Company.by_user(params[:current_user])
  end

  def show_action(record)
    actions = "<a href='/companies/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/companies/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/companies/#{record.id}'><i class='fa fa-times'></i></a>"
  end  
end
  