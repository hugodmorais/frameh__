class UserGroupsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      name: { source: "UserGroup.name" },
      birth_date: { source: "UserGroup.birth_date" },
      genre: { source: "UserGroup.genre" },
      actions: { source: "UserGroup.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        birth_date: record.birth_date,
        genre: record.genre,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    UserGroup.all
  end

  def show_action(record)
    actions = "<a href='/user_groups/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/user_groups/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/user_groups/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
  