Feature: Question Creation (Coding and MCQ)
  This feature verifies that the admin can create coding questions and MCQs with different input types and configurations.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can create a coding question with string input type
    When the admin navigates to the question creation page
    And the admin selects "coding question"
    And the admin sets the input type as "string"
    And the admin saves the question
    Then the coding question with string input type should be created successfully

  @positive
  Scenario: Verify admin can assign array as input type
    When the admin navigates to the question creation page
    And the admin selects "coding question"
    And the admin sets the input type as "array"
    And the admin saves the question
    Then the coding question with array input type should be created successfully

  @positive
  Scenario: Verify admin can assign 2D array as input type
    When the admin navigates to the question creation page
    And the admin selects "coding question"
    And the admin sets the input type as "2D array"
    And the admin saves the question
    Then the coding question with 2D array input type should be created successfully

  @positive
  Scenario: Verify admin can assign object as input type
    When the admin navigates to the question creation page
    And the admin selects "coding question"
    And the admin sets the input type as "object"
    And the admin saves the question
    Then the coding question with object input type should be created successfully

  @positive
  Scenario: Verify admin can preview coding question before saving
    When the admin navigates to the question creation page
    And the admin selects "coding question"
    And the admin inputs the question details
    And the admin clicks on "Preview"
    Then the coding question preview should be displayed correctly

  @positive
  Scenario: Verify admin can create an MCQ with multiple variants
    When the admin navigates to the MCQ creation page
    And the admin creates a base MCQ
    And the admin adds multiple variants to the MCQ
    And the admin saves the question
    Then the MCQ with multiple variants should be created successfully

  @positive
  Scenario: Verify admin can preview all MCQ variants before saving
    When the admin navigates to the MCQ creation page
    And the admin adds multiple variants
    And the admin clicks on "Preview"
    Then all variants of the MCQ should be displayed in the preview

  @positive
  Scenario: Verify admin can bulk upload MCQ variants via CSV
    When the admin navigates to the MCQ bulk upload page
    And the admin uploads a CSV with MCQs and variants
    And the admin saves the upload
    Then the MCQs and variants should be uploaded and saved successfully

  @negative
  Scenario: Attempt to create an assessment with no questions added
    When the admin navigates to the "Create Assessment" page
    And the admin fills in all required fields except adding questions
    And the admin clicks "Submit"
    Then the system should not allow the submission
    And the system should display an error message indicating that at least one question is required

