class CreateThreadComments < ActiveRecord::Migration
  def change
    create_table :thread_comments do |t|
      t.references :thread, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.timestamps null: false
    end
    add_index :thread_comments, [:thread_id, :comment_id], unique: true
  end
end
