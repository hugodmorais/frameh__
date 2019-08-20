class CreateFinancialStatements < ActiveRecord::Migration[5.2]
  def change
    create_table :financial_statements do |t|
      t.integer :month
      t.decimal :total_balance

      t.references :annual_management
      t.references :account
      t.timestamps
    end
  end
end
