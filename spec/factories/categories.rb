require 'faker'

FactoryGirl.define do
  factory :category do
    name { Faker::App.name }
    icon { 'network.png' }
    description { Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false) }
    user { user }
  end
end
