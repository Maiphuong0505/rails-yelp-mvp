class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :address, presence: true
  CATEGORY = %w[Chinese Italian Japanese French Belgian]
  validates :category, presence: true, inclusion: { in: CATEGORY, message: "%{value} is not a valid category" }

end
