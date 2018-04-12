class AddAttachmentAvatarToProperties < ActiveRecord::Migration[5.1]
  def self.up
    change_table :properties do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :properties, :avatar
  end
end
