class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.date :report_date
      t.float :spent_hours
      t.string :user1
      t.string :user2
      t.float :remaining_time
      t.float :estimated_time
      t.references :task

      t.timestamps
    end
    add_index :logs, :task_id
  end
end
