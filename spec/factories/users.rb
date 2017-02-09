FactoryGirl.define do
  factory :user do
    firstname { FFaker::Name.first_name }
    lastname  { FFaker::Name.last_name }
    email { FFaker::Interner.email }
    password { FFaker::Interner.password }
  end
end
