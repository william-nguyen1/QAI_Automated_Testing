  Feature: Give Negative Feedback

@page-feedback @anonymous-user
Scenario: Give negative page feedback as an Anonymous User
  Given I am at the home page
  When I navigate to the "page name" page
    And I scroll down to the footer section of the "page name"  page
    And I click on the 'Thumbs Down' icon
  Then I should not see the 'Thumbs Up' icon
     And I should not see the 'Thumbs Down' icon
     And I should not see the '+ More' icon
     And I should see a message of "Thank you! We appreciate your feedback."

 @page-feedback
 Scenario: Check Feedback list for a negative feedback entry
   Given I am at the home page
    And I am signed in as an Admin
   When I navigate to the 'Page Feedback' page
   Then I should see 'No' in the 'Was this page helpful' column
     And I should see "https://#" in the 'Page URL' column next to the 'No' entry
