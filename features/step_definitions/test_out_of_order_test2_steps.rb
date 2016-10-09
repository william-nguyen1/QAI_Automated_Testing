#should be run first
#but it is executed second since the steps file is named test_out_of_order_test2_steps
#instead of test_out_of_order_test1_steps

#therefore cucumber runs the tests in alphabetial order
#Thus leverage this when writing split testcases e.g Generic_Test_Case_Footer_links_1_add is run first,
#then Generic_Test_Case_Footer_links_2_edit (Requires Review)
#then Generic_Test_Case_Footer_links_3_delete (Requires Review) with the same tag e.g @add-edit-delete-footer-links
#or perhaps --tags @add-footer-link,@edit-footer-link,@delete-footer-link

# Given(/^I am on Google$/) do
#   $app.navigate_to_url("http://www.google.com")
# end
#
# When(/^I search for "([^"]*)"$/) do |query|
#   $app.home.enter_text('name', 'q', query)
#   $app.home.submit_query
# end
#
# Then(/^I should see "([^"]*)" as the page title$/) do |pageTitle|
#   sleep 5
#   $app.home.check_web_page_title(pageTitle)
# end
#
# Given(/^I am at the Browserstack website$/) do
#   step "I am on Google"
#   step "I search for \"BrowserStack\""
#   sleep 5
#   step "I click on the 'BrowserStack' link"
#   step "I should see the webpage for Browserstack"
# end
#
# When(/^I click on the "([^"]*)" button$/) do |text|
#   $browser.find_element(:link, text).click
# end
#
# Then(/^I should see a login form$/) do
#   $app.check_for_text(:css, "h2.text-center", "Sign up")
# end
