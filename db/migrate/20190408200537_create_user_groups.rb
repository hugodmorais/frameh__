class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.integer :genre
      t.datetime :birth_date
      t.references :user, foreign_key: true
      t.references :work_group, foreign_key: true

      t.timestamps
    end
  end
end
