class Service < ApplicationRecord
  belongs_to :user
  has_many :service_categories, dependent: :destroy
  has_many :categories, through: :service_categories

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0.0 }
end
