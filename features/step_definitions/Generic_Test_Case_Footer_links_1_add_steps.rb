Given(/^I am at the home page$/) do
  $app.navigate_to_url("https://naplanonline.qld.gov.au")
end

Given(/^I am signed in as a ContentAuthor$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am currently viewing the footer links page$/) do
  $app.click_on_settings_cog
  $app.click_site_contents_menu_item
  $app.site_contents.click_on_footer_links
  $app.footer_links.verify_footerlinks_page_is_displayed
end

When(/^I click on 'New Item'$/) do
  $app.footer_links.click_on_new_item
end

When(/^I add a new footer called "([^"]*)" with a url of "([^"]*)"$/) do |footer_name, hyperlink|
  $app.enter_text(:id, "Title_fa564e0f-0c70-4ab9-b863-0177e6ddd247_$TextField", footer_name)
  $app.enter_text(:id, "Z1FooterLink_845a2587-9283-4c27-a8cd-43542bda104e_$UrlFieldUrl", hyperlink)
  $app.enter_text(:id, "Z1FooterLink_845a2587-9283-4c27-a8cd-43542bda104e_$UrlFieldDescription", hyperlink)
  $app.footer_links.select_dropdown_option("New Window")
  $app.footer_links.click_save_button
end

Then(/^I should be taken back to the Footer Links list page$/) do
  $app.footer_links.verify_footerlinks_page_is_displayed
end

Then(/^I should see "([^"]*)" as the newly created footer item at the bottom of the list$/) do |footer_name|
  $app.footer_links.check_footer_link_exists(:link, "Newfooter", footer_name)
end

Then(/^I should see "([^"]*)" as the Approval Status$/) do |approval_status|
  $app.footer_links.check_for_approval_status(:xpath, "//tr[@id='1,12,0']/td[11]", approval_status)
end

Given(/^I am signed in as a ContentApprover$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select the the Footer Link labeled "([^"]*)"$/) do |footer_name|
  $app.footer_links.click_footer_link(footer_name)
end

When(/^In the sharepoint ribbon section I click the 'Approve\/Reject' button$/) do
  $app.footer_links.click_approve_reject_sharepoint_ribbon
end

When(/^I select the 'Approved' radio button$/) do
  $app.footer_links.select_approved_radio_button
end

When(/^I enter the text "([^"]*)" in the 'Comment' textbox$/) do |comment_text|
  $app.enter_text(:id, "ctl00_PlaceHolderMain_approveComment_ctl01_Comments", comment_text)
end

When(/^I click the 'OK' button$/) do
  $app.footer_links.click_OK_button
end

Then(/^I should see "([^"]*)" with an Approval Status of "([^"]*)"$/) do |footer_name, approval_status|
  $app.footer_links.check_for_approval_status(:xpath, "//tr[@id='2,12,0']/td[11]", approval_status)
end

When(/^I navigate to the bottom of the page$/) do
  $app.scroll_to_element(:link, "Copyright")
end

Then(/^I should see "([^"]*)" in the footer links$/) do |footer_name|
  $app.check_for_text(:link, "NewFooter", footer_name)
end

When(/^I click on the "([^"]*)" link$/) do |footer_name|
  $app.click_hyperlink(footer_name)
end

Then(/^I should see the URL for the footer link as "([^"]*)"$/) do |url|
  pending # Write code here that turns the phrase above into concrete actions
end
