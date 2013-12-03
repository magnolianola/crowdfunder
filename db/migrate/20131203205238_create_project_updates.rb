class CreateProjectUpdates < ActiveRecord::Migration
  def change
    create_table :project_updates do |t|
      t.text :comment
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
