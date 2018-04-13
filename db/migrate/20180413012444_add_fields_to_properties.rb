class AddFieldsToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :rental_rate, :string
    add_column :properties, :price, :string
    add_column :properties, :year_built, :string
    add_column :properties, :building_class, :string
    add_column :properties, :lease_type, :string
    add_column :properties, :overhead_doors, :string
    add_column :properties, :loading_docks, :string
    add_column :properties, :min_divisible, :string
    add_column :properties, :space_use, :string
    add_column :properties, :space_available, :string
    add_column :properties, :date_available, :string
    add_column :properties, :property_type, :string
    add_column :properties, :address, :string
    add_column :properties, :description, :text
    add_column :properties, :for_lease, :boolean
    add_column :properties, :for_sale, :boolean
    add_column :properties, :owner_name, :string

  end
end
