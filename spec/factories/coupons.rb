FactoryGirl.define do
  factory :coupon do
    value { FFaker::Number.number(5) }
  end
end
