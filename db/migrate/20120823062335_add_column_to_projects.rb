class AddColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :estimation_time, :float
  end
 def down
    remove_column :projects, :estimation_time
  end
end
