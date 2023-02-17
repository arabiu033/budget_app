class ServiceCategory < ApplicationRecord
  belongs_to :category
  belongs_to :service
end
