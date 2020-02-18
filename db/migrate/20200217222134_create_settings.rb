class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.boolean :primary_payments

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
