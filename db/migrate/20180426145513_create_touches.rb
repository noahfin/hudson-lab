class CreateTouches < ActiveRecord::Migration[5.1]
  def change
    create_table :touches do |t|
      t.boolean :email
      t.boolean :phone
      t.boolean :postcard
      t.boolean :social_media
      t.boolean :in_person
      t.boolean :letter
      t.text :description
      t.references :contact, foreign_key: true

      t.timestamps
    end
  end
end
