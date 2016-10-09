When(/^I nav to httpwatch$/) do
#  $browser.navigate.to "http://httpwatch:Password@www.httpwatch.com/httpgallery/authentication/#showExample10" #possible with chrome and firefox
  #firefox only
  $app.accept_pop_box

# NOTE: If your application serves both HTTP and HTTPS pages from behind Basic Auth then
# you will need to load one of each type before executing your test steps. Otherwise you
# will get authorization errors when switching between
# HTTP and HTTPS because the browser can't use Basic Auth credentials interchangeably
# (e.g. HTTP for HTTPS and vice versa).


  $browser.navigate.to "http://www.httpwatch.com/httpgallery/authentication/#showExample10"
end

When(/^I click display image$/) do
  $app.home.click_image
  # $browser.get "http://httpwatch:Password@www.httpwatch.com/httpgallery/authentication/#showExample10"
  # $browser.find_element(:id, "displayImage").click
end

When(/^I enter the basic auth details$/) do

  #ie only apparently
  $app.test_login
  #if you used sleep here the browser will freeze and cuase the image not to load, thus faling the next step. be careful with using sleep
end

Then(/^I should see an image$/) do
  sleep 4
    $app.scroll_to_element(:id, "downloadImg")
  $app.check_element_is_displayed(:id, "downloadImg")
end
