class CreateImports < ActiveRecord::Migration[6.0]
  def change
    create_table :imports do |t|
      t.integer :kind
      t.integer :status
      t.string :job_id
      t.datetime :started_at
      t.datetime :finished_at
      t.attachment :file
      t.text :error_description
      t.text :error_details
      t.references :user, index: true

      t.timestamps
    end
  end
end
