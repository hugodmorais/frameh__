class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :name, null: false, default: ''
      t.string :country, null: false, default: ''
      t.string :city

      t.timestamps
    end
  end
end
