class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.integer :user_id
      t.integer :task_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :memo

      t.timestamps
    end
  end
end
