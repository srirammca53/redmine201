class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :task_type
      t.string :disposition
      t.string :acceptor
      t.float :estimated_hours
      t.text :description
      t.references :story

      t.timestamps
    end
    add_index :tasks, :story_id
  end
end
