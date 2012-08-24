class AddColumnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :estimation_time, :float
  end
end
