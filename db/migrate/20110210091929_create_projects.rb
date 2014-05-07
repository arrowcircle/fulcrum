class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :point_scale, default: 'fibonacci'
      t.date :start_date
      t.integer :iteration_start_day, default: 1
      t.integer :iteration_length, default: 1
      t.integer :default_velocity, default: 10

      t.timestamps
    end
  end
end
