class Category < ApplicationRecord
  validates :title, presence: true, length: { in: 2..15 }
  has_many :books
end
