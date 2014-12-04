class AddColumnsUser < ActiveRecord::Migration
  def change
      add_column :users, :admin, :boolean
      add_column :users, :organization_id, :integer
  end
end
