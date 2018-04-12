class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.references :user, foreign_key: true
      t.references :property, foreign_key: true
      t.string :severity
      t.string :status
      t.text :comment
      t.references :deal, foreign_key: true

      t.timestamps
    end
  end
end
