class AddBathroomToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :bathroom, :string
  end
end
