class AddAvatarToProperties < ActiveRecord::Migration[5.1]
  def change
    def self.up
      add_attachment :properties, :avatar
    end

    def self.down
      remove_attachment :properties, :avatar
    end
    end
end
