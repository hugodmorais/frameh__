class ImportErrorsDatatable < ApplicationDatatable
  def view_columns
    @view_columns ||= {
      sheet: { source: "ImportError.sheet" },
      row_number: { source: "ImportError.row_number" },
      description: { source: "ImportError.description" },
    }
  end

  private

  def data
    records.map do |record|
      {
        sheet: record.sheet,
        row_number: record.row_number,
        description: record.description,
      }
    end
  end

  def get_raw_records
    ImportError.all
  end
end