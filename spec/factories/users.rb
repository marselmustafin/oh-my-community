FactoryBot.define do
  factory :user, aliases: %i[author commenter] do
    email
    full_name { Faker::Name.name }
    password { "123456" }
    password_confirmation { password }
    community
    rating { generate(:rating_value) }
  end

  trait :owner do
    role { :owner }
  end

  trait :member do
    role { :member }
  end
end
