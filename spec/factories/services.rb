require 'faker'

FactoryGirl.define do
  factory :service do
    name { Faker::App.name }
    amount { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    user { user }
  end
end
