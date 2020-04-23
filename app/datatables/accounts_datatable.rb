class AccountsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      name: { source: "Account.name" },
      country: { source: "Account.country" },
      main_account: { source: "Account.main_account" },
      credit_account: { source: "Account.credit_account" },
      savings_account: { source: "Account.savings_account" },
      currency_kind: { source: "Account.currency_kind.name" },
      description: { source: "Account.description" },
      actions: { source: "Account.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        country: record.country,
        main_account: record.main_account? ? "<i class='fa fa-check'></i></a>".html_safe : "<i class='fa fa-times'></i></a>".html_safe,
        credit_account: record.credit_account? ? "<i class='fa fa-check'></i></a>".html_safe : "<i class='fa fa-times'></i></a>".html_safe,
        savings_account: record.savings_account? ? "<i class='fa fa-check'></i></a>".html_safe : "<i class='fa fa-times'></i></a>".html_safe,
        currency_kind: record.currency_kind.name,
        description: record.description,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Account.all
  end

  def show_action(record)
    actions = "<a href='/accounts/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/accounts/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/accounts/#{record.id}'><i class='fa fa-times'></i></a>"
  end
end
