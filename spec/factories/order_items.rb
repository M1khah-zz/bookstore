FactoryGirl.define do
  factory :order_item do
    quantity { FFaker::Number.number(1) }
    price { FFaker::Number.decimal(2) }
  end
end
