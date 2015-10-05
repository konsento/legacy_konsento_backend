class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, null:false, foreign_key: true
      t.references :parent, index: true
      t.text :content, null: false
      t.timestamps null: false
    end
    add_foreing_key :comments, :comments, column: :parent_id
  end
end
