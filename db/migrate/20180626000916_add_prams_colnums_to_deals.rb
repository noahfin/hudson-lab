class AddPramsColnumsToDeals < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :utf8, :string
    add_column :posts, :authenticity_token, :string
    add_column :posts, :post, :string
  end
end
