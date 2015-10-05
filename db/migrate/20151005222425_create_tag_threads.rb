class CreateTagThreads < ActiveRecord::Migration
  def change
    create_table :tag_threads do |t|
      t.references :thread, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps null: false
    end
    add_index :tag_threads, [:thread_id, :tag_id], unique: true
  end
end
