Capybara.configure do |config|
  config.match = :prefer_exact
  config.always_include_port = true
  config.javascript_driver = :webkit
  config.asset_host = "http://#{ENV.fetch('HOST')}"
  config.app_host = "http://#{ENV.fetch('HOST')}"
  config.default_max_wait_time = 10
end
