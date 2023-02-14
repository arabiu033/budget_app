class Category < ApplicationRecord
  belongs_to :user
  has_many :service_categories, dependent: :destroy
  has_many :services, through: :service_categories

  validates :name, presence: true
  validates :icon, presence: true
end
