class CreditCard < ApplicationRecord
  belongs_to :user
  has_many :orders
  
  validates :number, :cvv, :exp_month, :exp_year, :firstname, :lastname, presence: true
  validates :number, length: { is: 16 }
  validates :cvv, length: { in: 3...4 }
  validates :number, :cvv, numericality: { only_integer: true }
end
