Capybara.configure do |config|
  config.match = :prefer_exact
  config.always_include_port = true
  config.javascript_driver = :webkit
  config.asset_host = "http://#{ENV.fetch('HOST')}"
  config.app_host = "http://lvh.me:5000"
end
