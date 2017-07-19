FactoryGirl.define do
  factory :recipe do
    title       Faker::Name.title
    components  Faker::Lorem.word
    body        Faker::Lorem.paragraph(2)
  end
end
