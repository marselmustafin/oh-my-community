FactoryBot.define do
  factory :rating do
    value { generate(:rating_value) }
    post
    user
  end
end
