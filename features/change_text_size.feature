  Feature: Change text size
  As a user with poor vision I want to be able to change the size of the text
  So I can read the text on the website more easily

@change-text-size
Scenario: Change text size
  Given I am on the home screen
  When I click 'T+' next to 'Text Size' at the top right corner of the page
  Then I should see the text size on the webpage increase
    And I should see a 'T-' icon next to the 'T+' icon
  When I click 'T+' next to 'Text Size' at the top right corner of the page again
  Then I should see the text size on the webpage increase again
  When I click 'T-' next to 'Text Size' at the top right corner of the page
  Then I should see the text size on the webpage decrease
  When I click 'T-' next to 'Text Size' at the top right corner of the page again
  Then I should see the text size on the webpage decrease again
    And I should not see the 'T-' icon next to the 'T+' icon #perhaps css hidden?
