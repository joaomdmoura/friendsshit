class Shit < ActiveRecord::Base
  attr_accessible :fid, :photo, :phrase, :uid, :video

  validates :phrase, :presence => true

  has_many :user, :through => :friends
  has_many :friends
end
