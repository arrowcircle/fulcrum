class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :note
      t.integer :user_id
      t.integer :story_id

      t.timestamps
    end
    add_index :notes, :user_id
    add_index :notes, :story_id
  end
end
