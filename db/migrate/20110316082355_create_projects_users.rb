class CreateProjectsUsers < ActiveRecord::Migration
  def change
    create_table :projects_users, id: false do |t|
      t.references :project
      t.references :user
    end
    add_index :projects_users, :project_id
    add_index :projects_users, :user_id
  end
end
