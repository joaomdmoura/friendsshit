# -*- encoding : utf-8 -*-
class Friend < ActiveRecord::Base
  attr_accessible :email, :fib, :image, :name

  EmailFormat = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  NameFormat = /^[A-ZÀ-ÿ\s-]+$/i

  validates :email, :uniqueness => true, :format => {:with => EmailFormat}
  validates :name, :format => { :with => NameFormat }
end
