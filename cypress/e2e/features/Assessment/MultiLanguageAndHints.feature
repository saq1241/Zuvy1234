Feature: Multi-language Support and Hints
  This feature verifies that the admin can enable multi-language support for assessments and configure hints for questions, allowing students to choose their preferred language and view hints during assessments.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can enable multi-language support for assessments
    When the admin navigates to the assessment settings
    And the admin enables multi-language support
    And the admin saves the changes
    Then multi-language support should be enabled successfully

  @positive
  Scenario: Verify students can select their preferred language before starting the assessment
    Given the student is logged in
    When the student navigates to the assessment page
    And the student selects a language option
    And the student starts the assessment
    Then the assessment should be displayed in the selected language

  @positive
  Scenario: Verify admin can modify the available language options
    When the admin navigates to assessment settings
    And the admin modifies the language options
    And the admin saves the changes
    Then the language options should be updated successfully

  @positive
  Scenario: Verify admin can add custom hints to each question
    When the admin navigates to question settings
    And the admin adds custom hints to the questions
    And the admin saves the changes
    Then custom hints should be added successfully to each question

  @positive
  Scenario: Verify students can view hints while attempting the question
    Given the student is logged in
    And the student is attempting the assessment
    When the student clicks on the hint option for a question
    Then the hint should be displayed to the student during the assessment

  @positive
  Scenario: Verify admin can modify or remove hints before publishing the assessment
    When the admin navigates to question settings
    And the admin modifies or removes hints
    And the admin saves the changes
    Then hints should be updated or removed successfully

  @negative
  Scenario: Attempt to enable multi-language support without selecting any languages
    When the admin navigates to the assessment settings
    And the admin enables multi-language support but does not select any languages
    And the admin clicks "Save"
    Then the system should display an error message indicating that at least one language must be selected
    And the system should prevent the submission

  @negative
  Scenario: Attempt to add a hint that exceeds the character limit
    When the admin navigates to question settings
    And the admin adds a hint that exceeds the allowed character limit
    And the admin clicks "Save"
    Then the system should display an error message indicating that the hint is too long
    And the system should prevent submission

  @negative
  Scenario: Attempt to modify the language option to an unsupported language
    When the admin navigates to assessment settings
    And the admin selects an unsupported language option
    And the admin clicks "Save"
    Then the system should display an error message indicating that the selected language is not supported
    And the system should prevent the submission
