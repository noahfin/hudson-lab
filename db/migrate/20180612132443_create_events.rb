class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.datetime :notification
      t.string :category
      t.string :attended

      t.timestamps
    end
  end
end
