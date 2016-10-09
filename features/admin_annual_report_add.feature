  Feature: Add an Annual Report
  As a admin I want to be able to add an Annual Report
  So I can inform the necessary stakeholders about the progress of QAI

@add-an-annual-report
Scenario: Add an annual report
  Given I am on the home page
    And I am signed in as an Admin
  When I click on the settings cog
   Then I should see the admin dashboard
  When I click on annual reports
  Then I should see a list of annual reports
  When I click on 'Add a Annual Report'
    And I enter '2016 Annual Report' in the title field
    And I click 'Browse'
    And I select my file #my need web interface to upload a file in order to test it with selenium web driver
    And I click submit
  Then I should see a "File successfully uploaded" message
  When I navigate to 'Annual Reports'
  Then I should see '2016 Annual Report'
