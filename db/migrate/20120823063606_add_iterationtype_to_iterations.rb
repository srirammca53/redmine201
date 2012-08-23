class AddIterationtypeToIterations < ActiveRecord::Migration
  def change
    add_column :iterations, :iterationtype, :string
  end
end
