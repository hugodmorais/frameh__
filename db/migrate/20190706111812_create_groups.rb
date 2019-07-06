class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.references :expense_category, foreign_key: true
      t.integer :expense_value
      
      t.timestamps
    end
  end
end
