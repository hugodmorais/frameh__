class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :name, null: false, default: ''
      t.string :password_digest, null: false, default: ''
      t.string :auth_token, null: false, index: true
      t.boolean :admin, default: 'false'

      t.timestamps
    end
  end
end
