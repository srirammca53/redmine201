class CreateUserstories < ActiveRecord::Migration
  def change
    create_table :userstories do |t|
      t.string :name
      t.string :disposition
      t.string :customer
      t.string :tracker
      t.string :status
      t.integer :priority
      t.integer :order
      t.float :estimated_hours
      t.text :description
      t.references :version

      t.timestamps
    end
    add_index :userstories, :version_id
  end
end
