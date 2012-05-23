class Shit < ActiveRecord::Base
  attr_accessible :fid, :photo, :phrase, :uid, :video

  has_many :user, :through => :friends
  has_many :friends
end
