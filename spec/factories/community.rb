FactoryBot.define do
  factory :community do
    name { Faker::Company.name }
    description { Faker::Lorem.sentence(3) }
    subdomain { generate(:community_subdomain) }
  end
end
