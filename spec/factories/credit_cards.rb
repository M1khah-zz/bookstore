FactoryGirl.define do
  factory :credit_card do
    firstname { FFaker::Name.first_name }
    lastname  { FFaker::Name.last_name }
    number {FFaker::Business.credit_card_number}
    cvv { FFaker::Number.number(3) }
    expiration_month  { FFaker::Number.between(1, 12) }
    expiration_year   { FFaker::Number.between(2017, 2050) }
  end
end
