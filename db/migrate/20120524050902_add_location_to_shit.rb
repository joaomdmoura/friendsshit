class AddLocationToShit < ActiveRecord::Migration
  def change
    add_column :shits, :location, :string
  end
end
