class AddFlagsToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :is_company, :boolean
    add_column :organizations, :is_client, :boolean
    add_column :organizations, :is_vendor, :boolean
  end
end
