Feature: User login

  Scenario: Visiting the Homepage
    Given I visit the homepage

  Scenario: User login with JWT
    When I login with JWT
    Then I should be redirected to the admin courses page
    And I should see a welcome message on the courses page
