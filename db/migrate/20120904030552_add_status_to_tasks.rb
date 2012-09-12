class AddStatusToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :status, :boolean
  end
end
