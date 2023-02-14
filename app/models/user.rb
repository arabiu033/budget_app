class User < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true
end
