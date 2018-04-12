class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.references :deal, foreign_key: true
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
