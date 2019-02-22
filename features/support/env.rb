require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require 'rspec'

Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Chrome.driver_path = "C:/Users/felipe.gteixeira/Desktop/db_test/processo-dbserver/features/support/drivers/chromedriver.exe"
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
end

Capybara.app_host = 'https://www.google.com'
Capybara.default_max_wait_time = 30
