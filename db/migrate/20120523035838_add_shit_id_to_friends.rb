class AddShitIdToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :shit_id, :integer
  end
end
