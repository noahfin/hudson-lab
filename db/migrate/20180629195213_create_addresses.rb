class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :suite
      t.string :county
      t.string :state
      t.string :country
      t.string :postal_code
      t.string :notes
      t.string :city
      t.string :street_num
      t.string :strret_name
      t.string :zip_code_ext

      t.timestamps
    end
  end
end
