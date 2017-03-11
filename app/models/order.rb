class Order < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :credit_card
  has_many :order_items, dependent: :destroy
  has_one :coupon

  aasm column: :state do
    state :in_progress, initial: true
    state :in_queue
    state :in_delivery
    state :delivered
    state :canceled

    event :process do
      transitions from: :in_progress, to: :in_queue
    end

    event :ship do
      transitions from: :in_queue, to: :in_delivery
    end

    event :complete do
      transitions from: [:in_queue, :in_delivery], to: :delivered
    end

    event :cancel do
      transitions from: [:in_queue, :in_delivery], to: :canceled
    end
  end
end
