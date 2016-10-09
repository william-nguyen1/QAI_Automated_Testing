Given(/^I am on Google$/) do
  $app.navigate_to_url("http://www.google.com")
end

When(/^I search for "([^"]*)"$/) do |query|
  $app.enter_text(:id, "lst-ib", query)
end

Then(/^I should see "([^"]*)" as the page title$/) do |pageTitle|
  sleep 5
  $app.check_web_page_title(pageTitle)
end

Given(/^I am at the Browserstack website$/) do
  $app.testmultisteps
end

When(/^I click on the "([^"]*)" button$/) do |text|
  $browser.find_element(:link, text).click
end

Then(/^I should see a login form$/) do
  $app.check_for_text(:css, "h2.text-center", "Sign up")
end
