class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  validates :title, presence: true, length: {in: 2..50}
  validates :description, presence: true, length: {in: 5..255}
end
