class RemoveAttachmentBathroomImageToFriends < ActiveRecord::Migration
  def self.up
    remove_attachment :bathroom_image 
  end

  def self.down
    remove_attachment :bathroom_image 
  end 

end
