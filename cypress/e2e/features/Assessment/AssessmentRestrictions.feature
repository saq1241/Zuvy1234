Feature: Assessment Restrictions (Group Access and Scheduling)
  This feature verifies that the admin can restrict access to assessments based on groups, configure scheduling, and manage conditions for accessing sections in the assessment.

  Background:
    Given the admin is logged in to the system

  @positive
  Scenario: Verify admin can assign an assessment to specific student groups
    When the admin navigates to assessment settings
    And the admin selects specific student groups to access the assessment
    And the admin saves the changes
    Then the assessment should be assigned to selected student groups successfully

  @positive
  Scenario: Verify students outside of the assigned groups cannot access the assessment
    Given the student is not in the assigned group
    When the student attempts to access the assessment
    Then the system should restrict access for students outside the assigned group

  @positive
  Scenario: Verify admin can modify group access before publishing the assessment
    When the admin navigates to assessment settings
    And the admin modifies the student group access
    And the admin saves the changes
    Then the group access should be updated successfully

  @positive
  Scenario: Verify admin can schedule an assessment for a future date and time
    When the admin navigates to the assessment scheduling page
    And the admin selects a future date and time for the assessment
    And the admin saves the schedule
    Then the assessment should be scheduled successfully for the specified future date and time

  @positive
  Scenario: Verify admin can modify the assessment schedule before publishing
    When the admin navigates to the assessment scheduling page
    And the admin modifies the date and time of the assessment
    And the admin saves the changes
    Then the assessment schedule should be updated successfully

  @positive
  Scenario: Verify admin can set conditions for unlocking sections based on scores
    When the admin navigates to the assessment settings
    And the admin sets conditions for unlocking sections based on scores in previous sections
    And the admin saves the changes
    Then sections should be unlocked based on the student’s performance in previous sections

  @negative
  Scenario: Attempt to create an assessment without selecting a batch
    When the admin navigates to 'Create Assessment' page
    And the admin fills in all required fields but does not select a batch
    And the admin clicks 'Submit'
    Then the system should show an error message that selecting a batch is mandatory before proceeding

  @negative
  Scenario: Attempt to schedule an assessment with a past date
    When the admin navigates to the 'Create Assessment' page
    And the admin selects a date in the past for the assessment schedule
    And the admin clicks 'Submit'
    Then the system should display an error message stating that past dates cannot be selected
    And the system should prevent submission

  @negative
  Scenario: Attempt to schedule an assessment with conflicting time zones
    When the admin navigates to 'Create Assessment' page
    And the admin sets conflicting time zones for the start and end times
    And the admin clicks 'Submit'
    Then the system should display an error message indicating conflicting time zones
    And the system should prevent the submission

  @negative
  Scenario: Attempt to assign an assessment to a non-existent user group
    When the admin navigates to assessment settings
    And the admin selects a non-existent student group
    And the admin clicks 'Save'
    Then the system should display an error message indicating that the selected group does not exist
    And the system should prevent submission
