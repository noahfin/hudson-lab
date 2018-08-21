class CreateJoinTableCanvasGroups < ActiveRecord::Migration[5.2]
  def change
    create_join_table :canvas, :groups do |t|
      t.index [:canva_id, :group_id]
      t.index [:group_id, :canva_id]
    end
  end
end
