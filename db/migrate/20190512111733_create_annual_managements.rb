class CreateAnnualManagements < ActiveRecord::Migration[5.2]
  def change
    create_table :annual_managements do |t|
      t.integer :year, null: false
      t.text :description

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
