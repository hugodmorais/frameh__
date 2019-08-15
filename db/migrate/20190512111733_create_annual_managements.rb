class CreateAnnualManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :annual_managements do |t|
      t.integer :year, null: false
      t.text :description

      t.timestamps
    end
    add_index :annual_managements, :year, unique: true
  end
end
