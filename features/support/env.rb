require 'selenium/webdriver'
require "rspec"
include RSpec::Expectations
include RSpec::Matchers
require_relative '../page_objects/all_page_objects'

url = "http://#{ENV['BS_USERNAME']}:#{ENV['BS_AUTHKEY']}@hub-cloud.browserstack.com/wd/hub"

capabilities = Selenium::WebDriver::Remote::Capabilities.new

capabilities['project'] = ENV['BS_AUTOMATE_PROJECT'] if ENV['BS_AUTOMATE_PROJECT']
capabilities['build'] = ENV['BS_AUTOMATE_BUILD'] if ENV['BS_AUTOMATE_BUILD']

if ENV['BS_AUTOMATE_OS']
  capabilities['os'] = ENV['BS_AUTOMATE_OS']
  capabilities['os_version'] = ENV['BS_AUTOMATE_OS_VERSION']
else
  capabilities['platform'] = ENV['SELENIUM_PLATFORM'] || 'ANY'
end

capabilities['browser'] = ENV['SELENIUM_BROWSER'] || 'chrome'
capabilities['browser_version'] = ENV['SELENIUM_VERSION'] if ENV['SELENIUM_VERSION']

browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities)

Before do |scenario|
  $browser = browser
end

$app ||= NaplanOnline::AppPage.new

at_exit do
  browser.quit
end
