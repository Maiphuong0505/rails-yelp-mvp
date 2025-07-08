class Review < ApplicationRecord
  belongs_to :restaurant
  RATING = [0, 1, 2, 3, 4, 5]
  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: RATING
  validates :content, presence: true
end
