class CreateJoinTableDealsCompanies < ActiveRecord::Migration[5.2]
  def change
    create_join_table :deals, :companies do |t|
      t.index [:deal_id, :company_id]
      t.index [:company_id, :deal_id]
    end
  end
end
