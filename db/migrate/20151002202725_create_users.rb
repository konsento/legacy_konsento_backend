class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, index: true
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.timestamps null: false
    end
  end
end
