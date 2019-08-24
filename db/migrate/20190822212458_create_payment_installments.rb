class CreatePaymentInstallments < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_installments do |t|
      t.string :name
      t.date :start_date, null: false
      t.integer :months_number
      t.decimal :total_value
      t.string :store_name
      t.string :description
      t.decimal :deposit_money
      t.decimal :monthly_installment
      t.decimal :amount_already_paid

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
