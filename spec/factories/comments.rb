FactoryGirl.define do
  factory :user_comment do
    association :author_name, factory: :user
    body        Faker::Lorem.paragraph(1)
  end

  factory :guest_comment do
    author_name Faker::Name.name
    body        Faker::Lorem.paragraph(1)
  end
end
