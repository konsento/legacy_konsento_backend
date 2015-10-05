class CreateThreads < ActiveRecord::Migration
  def change
    create_table :threads do |t|
      t.references :user, null: false, foreign_key: true
      t.references :parent, index: true
      t.references :group, null:false, foreign_key: true
      t.string :title, null: false
    end
    add_foreing_key :threads, :threads, column: :parent_id
    add_index :threads, [:user_id, :parent_id, :group_id], unique: true
  end
end
