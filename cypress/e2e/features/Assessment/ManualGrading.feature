Feature: Manual Grading and Comments
  This feature verifies that the admin can manually grade essay-type questions and add comments during grading.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can create essay-type questions
    When the admin navigates to the question creation page
    And the admin selects "essay-type question"
    And the admin saves the question
    Then the essay-type question should be created successfully

  @positive
  Scenario: Verify essay-type questions can be graded manually by admin
    When the admin navigates to the assessment grading page
    And the admin grades an essay-type question manually
    And the admin saves the grades
    Then the essay-type question should be graded successfully by the admin

  @positive
  Scenario: Verify admin can add comments during manual grading
    When the admin navigates to the manual grading page
    And the admin adds comments while grading the essay-type question
    And the admin saves the changes
    Then the comments should be added successfully during grading

  @negative
  Scenario: Attempt to submit manual grading without entering a score
    When the admin navigates to the manual grading page
    And the admin leaves the score field blank
    And the admin clicks "Submit"
    Then the system should display an error message indicating that a score is required
    And the system should prevent submission

  @negative
  Scenario: Attempt to grade an essay-type question with invalid characters in the score field
    When the admin navigates to the manual grading page
    And the admin enters special characters in the score field
    And the admin clicks "Submit"
    Then the system should display an error message indicating that only numeric values are allowed
    And the system should prevent submission

  @negative
  Scenario: Attempt to add comments that exceed the character limit during manual grading
    When the admin navigates to the manual grading page
    And the admin adds a comment that exceeds the allowed character limit
    And the admin clicks "Submit"
    Then the system should display an error message indicating that the comment is too long
    And the system should prevent submission

