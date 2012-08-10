class AddColumnToIteration < ActiveRecord::Migration
  def change
    add_column :iterations, :status, :string
  end
end
