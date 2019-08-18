class CreateContractStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_statuses do |t|
      t.string :key
      t.string :name

      t.timestamps
    end
    add_index :contract_statuses, :key, unique: true
  end
end
