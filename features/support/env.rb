require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'
require 'rspec'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

Capybara.configure do |config|
  config.run_server = false
  config.default_driver = :selenium
end

Capybara.app_host = 'https://www.google.com'
Capybara.default_max_wait_time = 30


Capybara.configure do
  Capybara.default_driver = :selenium
  Capybara.page.driver.browser.manage.window.maximize
end

#Selenium::WebDriver::Chrome.driver_path = ENV['HOME']+Dir[File.join(File.dirname(__FILE__)Desktop/db_test/processo-dbserver/features/support/drivers/chromedriver.exe"
