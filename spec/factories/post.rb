FactoryBot.define do
  factory :post do
    author
    community
    title { Faker::Company.name }
    text { Faker::Lorem.sentence(15) }
  end
end
