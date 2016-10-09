  Feature: Add an Event
  As a admin I want to be able to add an Event
  So I can inform the public about up-coming events involving QAI #business requirement

@add-an-event
Scenario: Add an event
Given I am on the home page
  And I am signed in as an Admin
When I click on the settings cog
 Then I should see the admin dashboard
When I click on events
Then I should see a list of events
When I click on 'Add a Event'
  And I enter 'QAI Event' in the title field
  And I enter 'Brisbane City Hall' in the location field
  And I select '12' in the day drop-down menu
  And I select '10' in the month drop-down menu
  And I select '2016' in the year drop-down menu
  And I enter "This is an event at Brisbane City Hall" in the event description field
  And I click 'Browse'
  And I select my chosen image #my need web interface to upload a file in order to test it with selenium web driver
  And I click submit
Then I should see a "Event successfully created" message
When I navigate to Events'
Then I should see 'QAI Event' in the list of events
When I click 'QAI Event'
Then I should see "QAI Event" as the title of the Event
  And I should see "12/10/16" next to 'Event date'
  And I should see "Brisbane City Hall" next to 'Location' #perhaps include a google maps to indicate the location
  And I should see the event description
  And I should see my uploaded image
