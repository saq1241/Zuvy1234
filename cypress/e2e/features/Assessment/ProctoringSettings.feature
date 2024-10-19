Feature: Proctoring Settings
  This feature verifies that the admin can configure and manage proctoring settings for assessments, including enabling features like copy-paste detection, tab-switch detection, identity verification, and generating reports.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can enable copy-paste detection for an assessment
    When the admin navigates to proctoring settings for an assessment
    And the admin enables copy-paste detection
    And the admin saves the settings
    Then copy-paste detection should be enabled successfully

  @positive
  Scenario: Verify admin can enable tab-switch detection for an assessment
    When the admin navigates to proctoring settings for an assessment
    And the admin enables tab-switch detection
    And the admin saves the settings
    Then tab-switch detection should be enabled successfully

  @positive
  Scenario: Verify proctoring settings can be configured per assessment
    When the admin navigates to proctoring settings for an assessment
    And the admin configures the proctoring settings
    And the admin saves the changes
    Then the proctoring settings should be saved successfully

  @positive
  Scenario: Verify admin can generate proctoring reports for completed assessments
    When the admin navigates to the assessment reports section
    And the admin selects a completed assessment
    And the admin generates a proctoring report
    Then the proctoring report should be generated successfully

  @positive
  Scenario: Verify admin can view detailed proctoring reports with detected anomalies
    When the admin navigates to a generated proctoring report
    And the admin views detected anomalies like tab switching and copy-pasting
    Then the detailed proctoring report should show all detected anomalies

  @positive
  Scenario: Verify admin can enable identity verification for an assessment
    When the admin navigates to the proctoring settings
    And the admin enables identity verification
    And the admin saves the changes
    Then identity verification should be enabled successfully for the assessment

  @positive
  Scenario: Verify identity verification prompts the user before starting the exam
    Given the student is logged in
    When the student selects a proctored assessment
    And the student attempts to start the exam
    Then the system should prompt the user for identity verification before starting

  @positive
  Scenario: Verify admin can view and confirm identity verification reports
    When the admin navigates to the assessment reports section
    And the admin views the identity verification report
    Then the admin should be able to view and confirm identity verification results

  @negative
  Scenario: Attempt to create an assessment with past dates
    When the admin navigates to 'Create Assessment' page
    And the admin enters a date in the past for the assessment schedule
    And the admin clicks 'Submit'
    Then the system should display an error message stating that past dates cannot be selected
    And the system should prevent the submission

  @negative
  Scenario: Attempt to schedule an assessment with an overlapping schedule
    When the admin navigates to 'Create Assessment' page
    And the admin sets the assessment time to overlap with an existing assessment
    And the admin clicks 'Submit'
    Then the system should display an error message stating that the schedule conflicts with an existing assessment
    And the system should prevent the submission

  @negative
  Scenario: Attempt to submit assessment creation form with special characters in the 'Assessment Name' field
    When the admin navigates to 'Create Assessment' page
    And the admin enters special characters in the 'Assessment Name' field
    And the admin clicks 'Submit'
    Then the system should display an error message indicating that special characters are not allowed
    And the system should prevent the form submission

  @negative
  Scenario: Attempt to submit an assessment without selecting a batch
    When the admin navigates to 'Create Assessment' page
    And the admin fills in all required fields but does not select a batch
    And the admin clicks 'Submit'
    Then the system should show an error message that selecting a batch is mandatory before proceeding
