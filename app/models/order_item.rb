class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book
  validates :price, :quantity, presence: true
  validates_numericality_of :price, :quantity
end
