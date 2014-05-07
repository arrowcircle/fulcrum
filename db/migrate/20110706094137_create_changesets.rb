class CreateChangesets < ActiveRecord::Migration
  def change
    create_table :changesets do |t|
      t.references :story
      t.references :project

      t.timestamps
    end
    add_index :changesets, :story_id
    add_index :changesets, :project_id
  end
end
