Feature: Assessment Configuration
  This feature verifies that the admin can configure assessments by assigning weightage, sections, timers, grading schemes, and managing their modifications.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can assign different weightage percentages to sections
    When the admin navigates to the assessment configuration page
    And the admin assigns weightage to coding, MCQ, and open-ended sections
    And the admin saves the assessment
    Then the weightage should be assigned successfully to all sections

  @positive
  Scenario: Verify weightage can be modified before publishing the assessment
    When the admin navigates to the assessment configuration page
    And the admin modifies the assigned weightage
    And the admin saves the changes
    Then the weightage should be updated successfully

  @positive
  Scenario: Verify admin can create multiple sections in an assessment
    When the admin navigates to the assessment creation page
    And the admin adds multiple sections (e.g., MCQ, coding, essay)
    And the admin saves the sections
    Then multiple sections should be created successfully in the assessment

  @positive
  Scenario: Verify admin can assign different timers to each section
    When the admin navigates to the section settings in the assessment
    And the admin sets different timers for each section
    And the admin saves the changes
    Then timers should be assigned successfully to each section

  @positive
  Scenario: Verify timer configuration can be previewed before publishing
    When the admin navigates to the assessment preview page
    And the admin checks the section timers in the preview
    Then the timers should be displayed correctly in the preview

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

  @negative
  Scenario: Enter invalid input in the 'Assessment Weightage' field
    When the admin navigates to the 'Create Assessment' page
    And the admin enters non-numeric characters in the 'Weightage' field
    And the admin clicks 'Submit'
    Then the system should display an error message indicating invalid input
    And the system should restrict submission

  @negative
  Scenario: Attempt to create an assessment with 0 weightage
    When the admin navigates to the 'Create Assessment' page
    And the admin enters 0 in the 'Weightage' field
    And the admin clicks 'Submit'
    Then the system should display an error message stating that weightage cannot be zero

  @negative
  Scenario: Attempt to create an assessment with a blank 'Duration' field
    When the admin navigates to the 'Create Assessment' page
    And the admin leaves the 'Duration' field blank
    And the admin clicks 'Submit'
    Then the system should display an error message stating that the duration field is required

  @negative
  Scenario: Enter invalid characters in 'Total Questions' field
    When the admin navigates to the 'Create Assessment' page
    And the admin enters letters or special characters in the 'Total Questions' field
    And the admin clicks 'Submit'
    Then the system should display an error message stating invalid characters
    And the system should prevent form submission
