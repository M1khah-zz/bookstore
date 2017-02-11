class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :review, presence: true, length: { in: 5..100 }
  validates :rating, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :user_id, :book_id, presence: true
end
