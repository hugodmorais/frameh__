class CreateCurrencyKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_kinds do |t|
      t.string :key, null:false
      t.string :name, null: false

      t.timestamps
    end
  end
end
