# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :email, :fb_token, :name

  validates :email, :uniqueness => true
  validates :name, :presence => true

  has_many :shits , :through => :friends
  has_many :friends

end
