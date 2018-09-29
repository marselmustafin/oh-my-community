FactoryBot.define do
  sequence(:email) { Faker::Internet.unique.email }
  sequence(:community_name) { Faker::Company.unique.name }
  sequence(:community_subdomain) { Faker::Internet.unique.domain_word }
end
