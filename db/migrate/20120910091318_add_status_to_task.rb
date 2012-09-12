class AddStatusToTask < ActiveRecord::Migration
 def change
    add_column :tasks, :status, :boolean,:default => 0
  end
end
