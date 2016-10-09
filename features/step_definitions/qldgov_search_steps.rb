Given(/^I am on the Queensland Government website$/) do
  $browser.manage.window.maximize
  $browser.navigate.to 'http://www.qld.gov.au/'
  #$app.take_screenshot
  sleep 10
  $app.screenshot("step1")
end

When(/^I scroll down to 'Services for Queenslanders'$/) do
  header_element = $browser.find_elements(:id, 'services-for-qlders').last
  header_element.location_once_scrolled_into_view
  sleep 10
  $app.screenshot("step2")
end

When(/^I type "([^"]*)" into the 'Find a service' box$/) do |searchText|
  $browser.find_element(:id, "search-query-primary").send_keys searchText
  sleep 10
    $app.screenshot("step3")
end

When(/^I click the Search button$/) do
  $browser.find_element(:id, "feature-search-submit").click
end

Then(/^I should see the search results$/) do
  sleep 10
  expect($browser.title).to eql("Search results | Queensland Government")
end

When(/^I click the translink link$/) do
  $browser.find_element(:link, "Event transport | translink.com.au").click
  sleep 10
end

Then(/^I should be on the "([^"]*)" page on the translink website$/) do |headerTitle|
  $app.check_for_text(:css, "h1", headerTitle)
end
