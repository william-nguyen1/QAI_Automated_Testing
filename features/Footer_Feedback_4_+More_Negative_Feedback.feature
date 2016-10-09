  Feature: Negative Feedback using +More icon 

@page-feedback @anonymous-user
Scenario: Give negative additional feedback as an Anonymous User
  Given I am at the home page
  When I scroll down to the footer section of the home page
    And I click on '+More'
  Then I should see a dialog box titled 'Page Feedback'
    And I should see a radio button titled "Useful"
    And I should see a radio button titled "Not Useful"
    And I should see a text field titled "Other Feedback (optional)"
  When I select the "Not Useful" radio button
    And I enter "This page is not very useful" in the 'Other Feedback (optional)' textbox
    And I click on the 'Submit Feedback' button
  Then I should not see the 'Page Feedback' dialog box
    And I should see a "Thank you! We appreciate your feedback." message

@page-feedback  @ContentCustodian
Scenario: Check Feedback list for a negative Additional feedback entry
  Given I am at the home page
   And I am signed in as a ContentCustodian
  When I navigate to the 'Page Feedback' page
  Then I should see 'No' in the 'Was this page helpful' column
    And I should see "https://naplanonline.qld.gov.au/#" in the 'Page URL' column next to the 'No' entry
    And I should see "This page is not very useful" in the 'Other feedback' column
