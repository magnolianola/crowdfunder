class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.integer :total_cost
      t.datetime :deadline

      t.timestamps
    end
  end
end
