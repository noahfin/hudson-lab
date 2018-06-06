class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.string :name
      t.string :description
      t.datetime :start_time
      t.datetime :finsh_time
      t.datetime :started_time
      t.datetime :finshed_time

      t.timestamps
    end
  end
end
