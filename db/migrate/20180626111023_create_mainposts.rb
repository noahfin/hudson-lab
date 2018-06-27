class CreateMainposts < ActiveRecord::Migration[5.2]
  def change
    create_table :mainposts do |t|
      t.text :body

      t.timestamps
    end
  end
end
