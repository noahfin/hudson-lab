class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :addres
      t.string :earnings
      t.string :rent
      t.string :sector
      t.string :age
      t.string :name

      t.timestamps
    end
  end
end
