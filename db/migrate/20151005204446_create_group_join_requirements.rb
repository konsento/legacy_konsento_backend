class CreateGroupJoinRequirements < ActiveRecord::Migration
  def change
    create_table :group_join_requirements do |t|
      t.references :group, null: false, foreign_key: true
      t.references :join_requirement, null: false, foreign_key: true
    end
    add_index :group_join_requirements, [:group_id, :join_requirement_id], unique: true
  end
end
