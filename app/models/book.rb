class Book < ApplicationRecord
  belongs_to :author
  belongs_to :category
  validates :title, presence:true, length: {in: 2..50}
end
