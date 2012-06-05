class FixPhotoColumnNameToPhotoId < ActiveRecord::Migration
  def change
    rename_column :shits, :photo, :photo_uid
  end
end
