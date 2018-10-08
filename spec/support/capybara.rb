Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.match = :prefer_exact
  config.always_include_port = true
  config.default_driver = :selenium_chrome
  config.javascript_driver = :chrome
  config.asset_host = "http://#{ENV.fetch('HOST')}"
  config.app_host = "http://#{ENV.fetch('HOST')}"
  config.default_max_wait_time = 10
end
