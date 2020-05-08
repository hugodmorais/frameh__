class CreateImportErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :import_errors do |t|
      t.string :sheet
      t.integer :row_number
      t.text :description
      t.references :import, foreign_key: true

      t.timestamps
    end
  end
end
