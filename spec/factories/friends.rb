# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :friend do
    name "test"
    email "test@test.com"
    fb_ib 1
    photo "image"
    association :user, :factory => :user
    association :shit, :factory => :shit
  end
end
