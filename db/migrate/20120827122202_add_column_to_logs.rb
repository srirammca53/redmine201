class AddColumnToLogs < ActiveRecord::Migration
  def change
    add_column :logs, :log_on, :date
  end
end
