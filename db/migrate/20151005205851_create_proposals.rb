class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parent, index: true
      t.references :thread, null: false, foreign_key: true
      t.text :content, null: false
      t.timestamps null: false
    end
    add_foreing_key :proposals, :proposals, column: :parent_id
    add_index :proposals, [:user_id, :parent_id, :thread_id], unique: true
  end
end
