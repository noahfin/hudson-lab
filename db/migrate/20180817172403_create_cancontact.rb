class CreateCancontact < ActiveRecord::Migration[5.2]
  def change
    create_table :cancontacts do |t|
      t.string :title
      t.boolean :contacted
      t.text :notes
    end
  end
end
