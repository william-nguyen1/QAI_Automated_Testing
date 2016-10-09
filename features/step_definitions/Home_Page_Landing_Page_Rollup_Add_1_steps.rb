When(/^I scroll down to the section of the home page called  "([^"]*)"$/) do |our_primary_focus|
  $app.scroll_to_element(:css, "#WebPartWPQ5 > div.ms-rtestate-field > div.row > div.col-lg-12.text-center > h2")
  $app.check_for_text(:css, "#WebPartWPQ5 > div.ms-rtestate-field > div.row > div.col-lg-12.text-center > h2", our_primary_focus)
end

Then(/^I should see a rollup of Landing pages$/) do
  $app.home.check_our_primary_focus_rollup_landing_pages
end

When(/^I add a new landing page called "([^"]*)"$/) do |arg1|
  $app.click_on_settings_cog
  $app.click_site_contents_menu_item
  $app.site_contents.click_create_new_subsite
  $app.site_contents.create_sub_site_form("A new subsite", "A test for adding a new subsite", "a_new_subsite")
  #add  "What's Happening Landing Page Association
  sleep 10
  $app.check_for_text(:css, "#pageTitle > div", "A new subsite")
  $app.click_on_settings_cog
  $app.click_edit_page_menu_item
end

When(/^I navigate back to the home page$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" in the landing page rollup$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click on "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" as the heading of the web page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see "([^"]*)" in the breadcrumbs$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a url of "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
