class CreateImportErrors < ActiveRecord::Migration[6.0]
  def change
    create_table :import_errors do |t|
      t.text :sheet, null: false
      t.integer :row_number, null: false
      t.text :description, null: false
      t.references :import, foreign_key: true

      t.timestamps
    end
  end
end
