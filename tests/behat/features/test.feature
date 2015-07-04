Feature: Behat Works
  As a developer
  I want to know that this works
  So I can move on to real features

  Scenario: Home page displays
    Given I am on the homepage
    Then I should see "Welcome to SilverStripe!"
