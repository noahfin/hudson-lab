class AddManyColoumnsToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :type_ofproperty, :string
    add_column :properties, :known_as, :string
    add_column :properties, :size_and_floors, :string
    add_column :properties, :space1, :text
    add_column :properties, :space2, :text
    add_column :properties, :space3, :text
    add_column :properties, :space4, :text
    add_column :properties, :space5, :text
    add_column :properties, :space6, :text
    add_column :properties, :rental_per_sf, :string
    add_column :properties, :cam_per_sf, :string
    add_column :properties, :cam, :string
    add_column :properties, :utilites_per_sf, :string
    add_column :properties, :taxes_per_sf, :string
    add_column :properties, :rental_includes, :text
    add_column :properties, :cleaning, :text
    add_column :properties, :electric, :text
    add_column :properties, :gross_rental_per_sf, :string
    add_column :properties, :escalations, :string
    add_column :properties, :parking, :string
    add_column :properties, :landlords_work, :string
    add_column :properties, :possession, :string
    add_column :properties, :lease_term, :string
    add_column :properties, :exclusive, :boolean
    add_column :properties, :add_comments, :text
    add_column :properties, :contact_person, :string
    add_column :properties, :availability, :text
    add_column :properties, :water_and_sewer, :string
  end
end
