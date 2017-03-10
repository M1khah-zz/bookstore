class Coupon < ApplicationRecord
  belongs_to :order

  validates :value, presence: true
  validates :value, length: { is: 5 }
  validates :value, numericality: { only_integer: true }
end
