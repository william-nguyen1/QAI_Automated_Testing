  Feature: Give Positive Feedback using +More icon

#note ommitted tests regarding Click on the "+More" link
#Within the Page Feedback dialog box - Select "Not Useful" and click on Submit" without entering text in the other feedback text field

#----------------------
#As an Anonymous User - Navigate to the homepage
#Click on the "+More" link
#Within the Page Feedback dialog box- Enter text into the Other Feedback Text field (do not select a Rating)
#* Ensure the user is returned a validation stating "You need to select one of the radio buttons"
#Click on Submit
#---------------

#As an Anonymous User - Navigate to the homepage
#Click on the "+More" link
#Within the Page Feedback lightbox - Enter the following text :
#` ~ ! @ # $ % ^ & * ( ) - _ = + [ { ] } \ | ; : ' " , < . > / ?
#Click on Submit
#Login as a Content Custodian and View the Feedback list
#Ensure the text for this shows the generic characters - not HTML translated characters


@page-feedback @anonymous-user
Scenario: Give positive additional feedback as an Anonymous User
  Given I am at the home page
  When I scroll down to the footer section of the home page
    And I hover over '+More'
  Then I should see "Additional Feedback" as the alternative text
  When I click on '+More'
  Then I should see a dialog box titled 'Page Feedback'
    And I should see a radio button titled "Useful"
    And I should see a radio button titled "Not Useful"
    And I should see a text field titled "Other Feedback (optional)"
  When I click on the 'Submit Feedback' button
  Then I should see a validation message with the text "You need to select one of the radio buttons"
  When I click the 'Cancel' button
  Then I should not see the 'Page Feedback' dialog box
  When I click on '+More' again
  Then I should not see the validation message when the 'Page Feedback' dialog box is displayed again
  When I select the "Useful" radio button
    And I enter "This page is useful" in the 'Other Feedback (optional)' textbox
    And I click on the 'Submit Feedback' button
  Then I should not see the 'Page Feedback' dialog box
    And I should see a "Thank you! We appreciate your feedback." message

 @page-feedback  @ContentCustodian
 Scenario: Check Feedback list for a positive Additional feedback entry
   Given I am at the home page
    And I am signed in as an Admin
   When I navigate to the 'Page Feedback' page
   Then I should see 'Yes' in the 'Was this page helpful' column
     And I should see "https://#" in the 'Page URL' column next to the 'Yes' entry
     And I should see "This page is useful" in the 'Other feedback' column
