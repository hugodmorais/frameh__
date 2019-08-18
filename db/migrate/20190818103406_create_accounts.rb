class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.boolean :main_account
      t.boolean :credit_account
      t.boolean :savings_account
      t.string :description
      t.string :country

      t.references :currency_kind

      t.timestamps
    end
  end
end
