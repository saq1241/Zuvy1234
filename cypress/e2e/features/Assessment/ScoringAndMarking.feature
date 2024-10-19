Feature: Scoring and Marking
  This feature verifies that the admin can configure different grading schemes, enable negative marking, and handle weightage configuration in assessments.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can assign a different grading scheme for each section
    When the admin navigates to the section grading settings
    And the admin assigns a specific grading scheme to each section
    And the admin saves the changes
    Then different grading schemes should be applied to each section

  @positive
  Scenario: Verify admin can modify the grading scheme before publishing
    When the admin navigates to the section grading settings
    And the admin modifies the grading scheme
    And the admin saves the changes
    Then the grading schemes should be updated successfully

  @positive
  Scenario: Verify admin can enable negative marking for wrong answers
    When the admin navigates to assessment grading settings
    And the admin enables negative marking
    And the admin saves the changes
    Then negative marking should be enabled successfully

  @positive
  Scenario: Verify system deducts marks for wrong answers in the assessment
    Given the student is logged in
    And the student attempts the assessment
    When the student submits answers with some wrong responses
    Then marks should be deducted for wrong answers according to the negative marking rule

  @positive
  Scenario: Verify admin can configure the negative marking ratio
    When the admin navigates to grading settings
    And the admin sets the negative marking ratio
    And the admin saves the changes
    Then the negative marking ratio should be configured successfully

  @positive
  Scenario: Verify admin can set custom weightage for different sections
    When the admin navigates to section settings
    And the admin sets custom weightage for each section
    And the admin saves the changes
    Then custom weightage should be successfully applied to each section

  @positive
  Scenario: Verify weighted sections are reflected correctly in assessment scoring
    Given the student is logged in
    And the student attempts an assessment with weighted sections
    When the student submits the assessment
    Then scoring should be calculated based on the custom weightage

  @negative
  Scenario: Enter negative marks in 'Maximum Marks' field
    When the admin navigates to 'Create Assessment' page
    And the admin enters a negative number in the 'Maximum Marks' field
    And the admin clicks 'Submit'
    Then the system should display an error message indicating that marks cannot be negative
    And the system should prevent the submission

  @negative
  Scenario: Attempt to create an assessment with 0 weightage
    When the admin navigates to 'Create Assessment' page
    And the admin enters 0 in the 'Weightage' field
    And the admin clicks 'Submit'
    Then the system should display an error message stating that weightage cannot be zero

  @negative
  Scenario: Attempt to configure negative marking ratio with non-numeric input
    When the admin navigates to grading settings
    And the admin enters non-numeric characters in the negative marking ratio field
    And the admin clicks 'Submit'
    Then the system should display an error message indicating invalid input
    And the system should prevent the submission
