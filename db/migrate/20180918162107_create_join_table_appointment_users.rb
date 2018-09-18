class CreateJoinTableAppointmentUsers < ActiveRecord::Migration[5.2]
  def change
    create_join_table :appointments, :users do |t|
      t.index [:appointment_id, :user_id]
      t.index [:user_id, :appointment_id]
    end
  end
end
