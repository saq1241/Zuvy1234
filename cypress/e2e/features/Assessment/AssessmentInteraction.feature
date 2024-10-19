Feature: Assessment Interaction (Randomization, Timer, and Section Behavior)
  This feature verifies that the admin can manage question randomization, configure section timers, and set conditions for section behavior based on scores.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can randomize question order in an assessment
    When the admin navigates to the assessment configuration page
    And the admin enables question randomization
    And the admin saves the changes
    Then the question order should be randomized in the assessment

  @positive
  Scenario: Verify admin can randomize MCQs and coding questions independently
    When the admin navigates to the assessment configuration page
    And the admin enables randomization for MCQs only
    And the admin saves the changes
    Then only the MCQs should be randomized, and coding questions should maintain their original order

  @positive
  Scenario: Verify randomization can be previewed before publishing the assessment
    When the admin navigates to the assessment preview page
    And the admin enables randomization
    Then the randomized question order should be displayed in the preview

  @positive
  Scenario: Verify admin can assign different timers to each section
    When the admin navigates to the section settings in the assessment
    And the admin sets different timers for each section
    And the admin saves the changes
    Then timers should be assigned successfully to each section

  @positive
  Scenario: Verify timer configuration can be previewed before publishing the assessment
    When the admin navigates to the assessment preview page
    And the admin checks the section timers in the preview
    Then the timers should be displayed correctly in the preview

  @positive
  Scenario: Verify admin can create sections that unlock based on previous section scores
    When the admin navigates to assessment settings
    And the admin sets conditions for unlocking sections based on scores
    And the admin saves the changes
    Then sections should be unlocked based on student performance in previous sections

  @positive
  Scenario: Verify student cannot access locked sections without meeting score conditions
    Given the student is logged in
    And the student attempts an assessment
    When the student tries to access a locked section without meeting score conditions
    Then the locked section should remain inaccessible until the score conditions are met

  @negative
  Scenario: Enter incomplete time range for the assessment schedule
    When the admin navigates to 'Create Assessment' page
    And the admin enters a start time but leaves the end time blank
    And the admin clicks 'Submit'
    Then the system should display an error message indicating that both start and end times are required

  @negative
  Scenario: Attempt to create an assessment with an overlapping schedule
    When the admin navigates to 'Create Assessment' page
    And the admin sets the assessment time to overlap with an existing assessment
    And the admin clicks 'Submit'
    Then the system should display an error message stating that the schedule conflicts with an existing assessment
    And the system should prevent the submission

  @negative
  Scenario: Attempt to set the duration longer than allowed (e.g., over 24 hours)
    When the admin navigates to 'Create Assessment' page
    And the admin sets the 'Duration' field to an excessively long period
    And the admin clicks 'Submit'
    Then the system should display an error message indicating the duration exceeds the allowed limit
    And the system should prevent submission
