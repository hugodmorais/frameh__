class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name, null: false, default: ''
      t.string :country, null: false, default: ''
      t.string :city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
