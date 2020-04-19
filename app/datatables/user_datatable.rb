class UserDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      name: { source: "User.name" },
      email: { source: "User.email" },
      admin: { source: "User.admin" },
      actions: { source: "User.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        email: record.email,
        admin: record.admin ? "<span class='glyphicon glyphicon-ok'></span>".html_safe : "<span class='glyphicon glyphicon-remove'></span>".html_safe,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    User.all
  end

  def show_action(record)
    actions = "<a href='/users/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/users/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/users/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
  