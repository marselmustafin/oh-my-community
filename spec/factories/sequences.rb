FactoryBot.define do
  sequence(:email) { Faker::Internet.unique.email }
  sequence(:community_name) { Faker::Company.unique.name }
  sequence(:community_subdomain) { generate_subdomain }
  sequence(:rating_value) { rand(1..5) }
end

def generate_subdomain
  subdomain = Faker::Internet.unique.domain_word

  if reserved_list.include?(subdomain)
    generate_subdomain
  else
    subdomain
  end
end

def reserved_list
  @reserved_list ||= YAML.load_file(Rails.root.join("app", "validators", "reserved-subdomains.yaml"))
end
