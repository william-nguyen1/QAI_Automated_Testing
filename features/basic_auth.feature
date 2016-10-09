Feature: run basic auth

@basic
Scenario: get basic auth to work
When I nav to httpwatch
  And I click display image
  And I enter the basic auth details
Then I should see an image
