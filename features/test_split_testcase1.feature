Feature: Google can search

@google-go-to-search
Scenario: Search Google for "BrowserStack"
  Given I am on Google
  When I search for "BrowserStack"
  Then I should see "BrowserStack - Google Search" as the page title

@BrowserStack
Scenario: Click a link in the browserstack webpage
  Given I am at the Browserstack website
  When I click on the "Sign up for free" button
  Then I should see a login form

  @qldgov-search
Scenario: Find event transport details
  Given I am on the Queensland Government website
  When I scroll down to 'Services for Queenslanders'
  And I type "event transport" into the 'Find a service' box
  And I click the Search button
  Then I should see the search results
  When I click the translink link
  Then I should be on the "Event transport" page on the translink website
