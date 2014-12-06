class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :full_name
      t.string :cnpj
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :zipcode
      t.string :city
      t.string :state
      t.string :country
      t.string :website
      t.string :primary_email

      t.timestamps
    end
  end
end
