# -*- encoding : utf-8 -*-
class Friend < ActiveRecord::Base
  attr_accessible :email, :fb_ib, :image, :name, :photo_url
  image_accessor :photo

  EmailFormat = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  NameFormat = /^[A-ZÀ-ÿ\s-]+$/i

  validates :email, :uniqueness => true, :format => {:with => EmailFormat}, :allow_nil => true
  validates :name, :format => { :with => NameFormat }

  belongs_to :user
  belongs_to :shit
end
