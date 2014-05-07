class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.integer :estimate
      t.string :story_type, default: 'feature'
      t.string :state, default: 'unstarted'
      t.date :accepted_at
      t.integer :requested_by_id
      t.integer :owned_by_id
      t.references :project
      t.decimal :position
      t.string :labels

      t.timestamps
    end
    add_index :stories, :project_id
    add_index :stories, :requested_by_id
    add_index :stories, :owned_by_id
  end
end
