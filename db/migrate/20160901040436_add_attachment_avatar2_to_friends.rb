class AddAttachmentAvatar2ToFriends < ActiveRecord::Migration
  def self.up
    change_table :friends do |t|
      t.attachment :avatar2
    end
  end

  def self.down
    remove_attachment :friends, :avatar2
  end
end
