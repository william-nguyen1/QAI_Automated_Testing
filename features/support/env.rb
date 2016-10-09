require 'selenium/webdriver'
require_relative '../page_objects/all_page_objects'
require "rspec"
include RSpec::Expectations
include RSpec::Matchers
include Cucumber::RbSupport::RbDsl

target = ENV['SELENIUM_TARGET']

$app ||= QAI::AppPage.new
$wait = Selenium::WebDriver::Wait.new(:timeout => 10) #for use if elements are displayed or not (probably not a good idea for clicking elements etc)
World(QAI)

Before do |scenario|
  if 'Chrome'.eql? target
    puts 'Testing on Chrome...'
    $browser = Selenium::WebDriver.for :chrome
  elsif 'Firefox'.eql? target
    puts 'Testing on Firefox...'
    $browser = Selenium::WebDriver.for :firefox
  elsif 'IE'.eql? target
    puts 'Testing on IE...'
    $browser = Selenium::WebDriver.for :ie
  elsif 'BrowserStack'.eql? target
    puts 'Testing on BrowserStack...'

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

    $browser = Selenium::WebDriver.for(:remote, :url => url, :desired_capabilities => capabilities, :http_client => client)

  else
    raise 'Please run cucumber with a profile'
  end
end

After do |scenario|
  encoded_img = $browser.screenshot_as(:base64)
  embed("data:image/png;base64,#{encoded_img}",'image/png')
  $browser.quit
end
