class CreateAppids < ActiveRecord::Migration
  def change
    create_table :appids do |t|
      t.string :session
      t.string :name
      t.string :email
      t.integer :spacecount
      t.integer :spaceids, array:true, default: []

      t.timestamps null: false
    end
  end
end
