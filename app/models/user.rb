# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :email, :fb_token, :name

  EmailFormat = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  NameFormat = /^[A-ZÀ-ÿ\s-]+$/i

  validates :email, :uniqueness => true, :format => {:with => EmailFormat}
  validates :name, :format => { :with => NameFormat }

  has_many :shits , :through => :friends
  has_many :friends

end
