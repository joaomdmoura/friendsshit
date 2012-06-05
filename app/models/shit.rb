class Shit < ActiveRecord::Base
  attr_accessible :fid, :photo_url, :phrase, :uid, :video, :location
	image_accessor :photo

  validates :phrase, :presence => true

  has_many :user, :through => :friends
  has_many :friends
end