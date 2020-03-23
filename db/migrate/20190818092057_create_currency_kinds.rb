class CreateCurrencyKinds < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_kinds do |t|
      t.string :name, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
