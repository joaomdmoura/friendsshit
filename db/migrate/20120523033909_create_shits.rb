class CreateShits < ActiveRecord::Migration
  def change
    create_table :shits do |t|
      t.string :phrase
      t.integer :uid
      t.integer :fid
      t.string :photo
      t.string :video

      t.timestamps
    end
  end
end
