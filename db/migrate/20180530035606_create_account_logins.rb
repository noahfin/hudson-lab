class CreateAccountLogins < ActiveRecord::Migration[5.1]
  def change
    create_table :account_logins do |t|
      t.string :ipAddress
      t.string :loginTime
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
