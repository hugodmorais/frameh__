class CreateExpenseCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :expense_categories do |t|
      t.string :name 
      t.boolean :primary_payment, default: false
      
      t.timestamps
    end
  end
end
