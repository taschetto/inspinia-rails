class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :budget
      t.boolean :block
      t.integer :organization_id

      t.timestamps
    end
  end
end
