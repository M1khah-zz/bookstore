FactoryGirl.define do
  factory :rating do
    rating {FFaker::Number.between(from = 1.00, to = 5.00)}
    review {FFaker::Lorem.sentence}
  end
end
