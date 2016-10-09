  Feature: Search Blog posts
  As a user I want to search for Blogs posts
  So that I am up-to-date with QAI news

@search-blog-posts
Scenario: The Back to Top button web part should not show while at the top of the page, while logged in as a ContentAuthor
Given I am on the home page
When I enter "blog post" in the search field
  And I click the search button
Then I should see "blog post" in the list of search results
When I click on "blog post"
Then I should see "blog post" in the header at the top of the page
