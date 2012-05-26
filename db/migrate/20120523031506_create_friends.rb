class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :email
      t.string :photo_uid
      t.integer :fb_ib

      t.timestamps
    end
  end
end
