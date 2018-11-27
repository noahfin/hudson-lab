class CreateTenants < ActiveRecord::Migration[5.2]
  def change
    create_table :tenants do |t|
      t.string :company_name
      t.text :notes

      t.timestamps
    end
  end
end
