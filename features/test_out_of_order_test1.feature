Feature: Google can search

@google
Scenario: Click on Browserstack link
  Given I am on the 'BrowserStack - Google Search' search results screen
  When I click on the 'BrowserStack' link
  Then I should see the webpage for Browserstack
