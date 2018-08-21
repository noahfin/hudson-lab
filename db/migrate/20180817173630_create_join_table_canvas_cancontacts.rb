class CreateJoinTableCanvasCancontacts < ActiveRecord::Migration[5.2]
  def change
    create_join_table :canvas, :cancontacts do |t|
      t.index [:canva_id, :cancontact_id]
      t.index [:cancontact_id, :canva_id]
    end
  end
end
