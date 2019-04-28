class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :month, null: false
      t.integer :kind, null: false, index: true
      t.decimal :income_value

      t.references :user_group, foreign_key: true
      t.references :annual_management, foreign_key: true
      t.references :income_category, foreign_key: true
      t.timestamps
    end
  end
end
