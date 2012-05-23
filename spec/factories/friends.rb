# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :friend do
    name "test"
    email "test@test.com"
    fib 1
    image "image"
  end
end
