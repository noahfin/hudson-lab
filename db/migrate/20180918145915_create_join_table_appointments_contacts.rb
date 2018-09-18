class CreateJoinTableAppointmentsContacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :appointments, :contacts do |t|
      t.index [:appointment_id, :contact_id]
      t.index [:contact_id, :appointment_id]
    end
  end
end
