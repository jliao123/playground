class AddAttachmentBathroomImageToFriends < ActiveRecord::Migration
  def self.up
    change_table :friends do |t|
      t.attachment :bathroom_image
    end
  end

  def self.down
    remove_attachment :friends, :bathroom_image
  end
end
