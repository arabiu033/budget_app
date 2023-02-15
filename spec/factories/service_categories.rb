require 'faker'

FactoryGirl.define do
  factory :service_category do
    service { service }
    category { category }
  end
end
