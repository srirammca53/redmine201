class CreateTimereports < ActiveRecord::Migration
  def change
    create_table :timereports do |t|
      t.string :user
      t.date :start_date
      t.date :end_date
      t.references :user

      t.timestamps
    end
    add_index :timereports, :user_id
  end
end
