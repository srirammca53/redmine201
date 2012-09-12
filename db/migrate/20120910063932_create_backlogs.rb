class CreateBacklogs < ActiveRecord::Migration
  def change
    create_table :backlogs do |t|

      t.timestamps
    end
  end
end
