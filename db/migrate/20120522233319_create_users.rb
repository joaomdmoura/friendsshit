class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :fb_id
      t.string :fb_token

      t.timestamps
    end
  end
end
