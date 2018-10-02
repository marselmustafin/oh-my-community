# Extend this module in spec/support/features/*.rb
module FeatureHelpers
  def visit_community(community, path = "/")
    app_host = "http://#{community.subdomain}.lvh.me"
    using_app_host(app_host) do
      visit path
    end
  end

  def using_app_host(host)
    original_host = Capybara.app_host
    Capybara.app_host = host
    yield
  ensure
    Capybara.app_host = original_host
  end
end

RSpec.configure do |config|
  config.include FeatureHelpers, type: :feature
end
