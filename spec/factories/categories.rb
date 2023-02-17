require 'faker'

FactoryGirl.define do
  factory :category do
    name { Faker::App.name }
    icon { 'https://images.unsplash.com/photo-1560365163-3e8d64e762ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWxpbmclMjBmYWNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80' }
    description { Faker::Hipster.paragraph_by_chars(characters: 100, supplemental: false) }
    user { user }
  end
end