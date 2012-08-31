class AddTypeofprojectToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :typeofproject, :string
  end
end
