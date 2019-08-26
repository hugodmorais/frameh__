class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.integer :month
      t.integer :kind
      t.decimal :income_value

      t.references :user_group, foreign_key: true
      t.references :annual_management, foreign_key: true
      t.references :income_category, foreign_key: true
      t.timestamps
    end
    add_index :income_category
  end
end
