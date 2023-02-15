class Category < ApplicationRecord
  belongs_to :user
  has_many :service_categories, dependent: :destroy
  has_many :services, through: :service_categories

  validates :name, presence: true
  validates :icon, presence: true

  def all_services
    @services = ServiceCategory.includes(:service).where('category_id = ?', id).order(:updated_at)
    @services
  end

  def total_sum
    all_services.sum('amount')
  end
end
