class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :business
      t.string :address
      t.string :email
      t.string :date
      t.string :phone
      t.string :number
      t.string :size_requirement
      t.string :location_need
      t.string :time_requirement
      t.text :notes
      t.boolean :active
      t.references :contact, foreign_key: true
      t.references :property, foreign_key: true

      t.timestamps
    end
  end
end
