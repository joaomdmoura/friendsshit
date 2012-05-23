class AddShitIdToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :shits_id, :integer
  end
end
