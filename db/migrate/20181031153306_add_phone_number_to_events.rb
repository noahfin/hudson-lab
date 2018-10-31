class AddPhoneNumberToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :phone_number, :string
  end
end
