FactoryBot.define do
  factory :comment do
    commenter
    post
    content { Faker::Lorem.sentence(4) }
  end
end
