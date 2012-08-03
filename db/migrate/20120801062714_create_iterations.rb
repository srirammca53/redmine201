class CreateIterations < ActiveRecord::Migration
  def change
    create_table :iterations do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.references :project

      t.timestamps
    end
    add_index :iterations, :project_id
  end
end
