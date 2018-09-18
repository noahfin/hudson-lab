class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :phone_number
      t.datetime :time
      t.string :fulladdress

      t.timestamps
    end
  end
end
