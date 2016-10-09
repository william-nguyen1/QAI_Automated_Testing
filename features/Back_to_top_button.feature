  Feature: Back to top button
  As a user I want to navigate to the top of the page by clicking a button
  So that I don’t have to scroll up the page if I need to click something at the top of the page

@back-to-top @ContentAuthor
Scenario: The Back to Top button web part should not show while at the top of the page, while logged in as a ContentAuthor
  Given I am on the home page
  When I am at the top of the page
  Then the 'Back to Top' web part should not be visible in the bottom right hand corner of the screen
  When I scroll down to the footer
  Then I should see the 'back to top' button
  When I click the 'back to top' button
  Then I should see 'Welcome to QAI' at the top of the webpage
