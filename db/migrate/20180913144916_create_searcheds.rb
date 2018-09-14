class CreateSearcheds < ActiveRecord::Migration[5.2]
  def change
    create_table :searcheds do |t|
      t.string :name
      t.string :contact_id
      t.string :number
      t.string :email
      t.string :cell
      t.string :fulladdress

      t.timestamps
    end
  end
end
