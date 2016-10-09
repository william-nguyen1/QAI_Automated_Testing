  Feature: Give Positive Feedback

#Confirm that:
# * Selecting the Thumbs up in the footer - adds a new entry to the page feedback list
# * Selecting the Thumbs down in the footer - adds a new entry to the page feedback list
# * Selecting the +More spawns the page feedback lightbox
# * Selecting Useful in the page feedback lightbox and submitting - submits the feedback
# * Selecting Not Useful in the page feedback lightbox and submitting - submits the feedback
# * Submitting Other Feedback text is written to the feedback list
#* Ensure Validation is present based on required fields
# * Ensure "special characters" are handled accordingly

 @page-feedback @anonymous-user
 Scenario: Give positive page feedback as an Anonymous User
   Given I am at the home page
   When I scroll down to the footer section of the home page
     And I hover over the 'Thumbs Up' icon
   Then I should see "This page was useful" as the alternative text
   When I hover over the 'Thumbs Down' icon
   Then I should see "This page was not useful" as the alternative text
   When I click on the 'Thumbs Up' icon
   Then I should not see the 'Thumbs Up' icon
      And I should not see the 'Thumbs Down' icon
      And I should not see the '+ More' icon
      And I should see a "Thank you! We appreciate your feedback." message

@page-feedback  @ContentCustodian
Scenario: Check Feedback list for a positive feedback entry
  Given I am at the home page
   And I am signed in as an Admin
  When I navigate to the 'Page Feedback' page
  Then I should see 'Yes' in the 'Was this page helpful' column
    And I should see "https:/#" in the 'Page URL' column next to the 'Yes' entry
