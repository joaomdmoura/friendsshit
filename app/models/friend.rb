# -*- encoding : utf-8 -*-
class Friend < ActiveRecord::Base
  attr_accessible :email, :fb_ib, :image, :name, :photo_url
  image_accessor :photo

  validates :email, :uniqueness => true, :allow_nil => true
  validates :name, :presence

  belongs_to :user
  belongs_to :shit
end
