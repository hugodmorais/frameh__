class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :month
      t.integer :kind
      t.decimal :expense_value

      t.references :user_group, foreign_key: true
      t.references :annual_management, foreign_key: true
      t.references :expense_category, foreign_key: true
      t.timestamps
    end
  end
end
