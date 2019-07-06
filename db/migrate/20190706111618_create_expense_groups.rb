class CreateExpenseGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_groups do |t|
      t.integer :expense_value

      t.references :expense
      t.references :group
      t.references :expense_category

      t.timestamps
    end
  end
end
