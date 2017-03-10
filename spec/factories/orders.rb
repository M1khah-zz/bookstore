FactoryGirl.define do
  factory :order do
    total_price { FFaker::Commerce.price }
  end
end
