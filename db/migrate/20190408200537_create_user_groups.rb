class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.string :name, null: false
      t.string :nif
      t.string :card_identify
      t.string :phone
      t.text :comment
      t.text :address
      t.integer :genre
      t.datetime :birth_date
      
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
