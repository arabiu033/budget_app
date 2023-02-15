exit if !Rails.env.development?
require 'factory_girl_rails'

puts "Delete the data"
ServiceCategory.delete_all
Category.delete_all
Service.delete_all
User.delete_all

puts "Create users"
a = Random.rand(8..15)
a.times do
  FactoryGirl.create(:user)
end

User.all.each do |user|
  a = Random.rand(1..5)
  a.times do
    FactoryGirl.create(:category, :user => user)
    FactoryGirl.create(:service, :user => user)
  end
end

Category.all.each do |ctg|
  a = Random.rand(5..10)
  a.times do
    FactoryGirl.create(:service_category, :service => Service.all[Random.rand(0...Service.all.length)], :category => ctg)
  end
end