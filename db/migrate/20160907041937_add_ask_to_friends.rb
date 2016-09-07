class AddAskToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :ask, :text
  end
end
