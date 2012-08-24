class AddColumnToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :last_mail, :date ,:default => Time.now.to_date
  end
end
