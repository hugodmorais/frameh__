class ContractsDatatable < ApplicationDatatable

  def view_columns
    @view_columns ||= {
      name: { source: "Contract.name" },
      start_date: { source: "Contract.start_date" },
      end_date: { source: "Contract.end_date" },
      contract_status: { source: "Contract.name" },
      actions: { source: "Contract.id", sortable: false, searchable: false }
    }
  end

  private

  def data
    records.map do |record|
      {
        name: record.name,
        start_date: record.start_date,
        end_date: record.end_date,
        contract_status: record.contract_status.name,
        actions: show_action(record).html_safe
      }
    end
  end

  def get_raw_records
    Contract.all
  end

  def show_action(record)
    actions = "<a href='/contracts/#{record.id}'><i class='fa fa-eye'></i></a> "
    actions += "<a href='/contracts/#{record.id}/edit'><i class='fa fa-edit'></i></a> "
    actions += "<a data-confirm='Tem a certeza que pretende eliminar?'' rel='nofollow' data-method='delete' href='/contracts/#{record.id}'><i class='fa fa-times'></i></a>"
  end  
end
