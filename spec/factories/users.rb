FactoryBot.define do
  factory :user, aliases: %i[author commenter] do
    email
    full_name { Faker::Name.name }
    password { "123456" }
    password_confirmation { password }
    community
    rating { generate(:rating_value) }
    confirmed_at { 1.hour.ago }
  end

  trait :not_confirmed do
    confirmed_at { nil }

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end

  trait :owner do
    role { :owner }
  end

  trait :member do
    role { :member }
  end
end
