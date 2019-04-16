class CreateWorkGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :work_groups do |t|
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end
end
