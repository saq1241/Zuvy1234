Feature: Home Page Accessibility

  Scenario: Verify the main message and login on the home page
    Given I open the Zuvy home page
    Then I should see the text "Embark your learning journey with Zuvy in Seconds."
    When I login with JWT
    Then I should be redirected to the admin courses page
    And I should see an h1 tag with the text "Courses"
