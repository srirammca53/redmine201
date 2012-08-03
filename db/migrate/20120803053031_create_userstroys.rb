class CreateUserstroys < ActiveRecord::Migration
  def change
    create_table :userstroys do |t|
      t.string :name
      t.text :description
      t.string :customer
      t.string :tracker
      t.string :status
      t.integer :priority
      t.integer :order
      t.float :Estimated_hours
      t.references :iteration

      t.timestamps
    end
    add_index :userstroys, :iteration_id
  end
end
