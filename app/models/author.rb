class Author < ApplicationRecord
  has_many :books
  validates :firstname, :lastname, presence: true, length: { in: 2..20 }
end
