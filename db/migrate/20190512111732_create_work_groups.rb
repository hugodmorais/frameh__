class CreateWorkGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :work_groups do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.references :work, foreign_key: true
      t.references :user_group, foreign_key: true

      t.timestamps
    end
  end
end
