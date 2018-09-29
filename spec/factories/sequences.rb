FactoryBot.define do
  sequence(:email) { Faker::Internet.unique.email }
  sequence(:community_name) { Faker::Company.unique.name }
  sequence(:community_subdomain) { Faker::Internet.unique.domain_word }
  sequence(:rating_value) { rand(1..5) }
end
