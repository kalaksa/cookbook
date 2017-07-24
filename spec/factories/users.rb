FactoryGirl.define do
  factory :user do
    username    Faker::Name.name
    email       Faker::Internet.email
    admin       false
    password    '123456789'
    confirmed_at Date.today

    trait :admin do
      admin true
    end
  end
end
