FactoryBot.define do
  factory :post do
    author
    community
    title { Faker::Company.name }
    text { Faker::Lorem.paragraph(50, true, 4) }
  end
end
