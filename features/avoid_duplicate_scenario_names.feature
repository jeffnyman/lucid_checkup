Feature: Avoid Duplicate Scenario Names

  This cop looks for cases where there are multiple scenarios in a
  feature file with the same name.

  Scenario: Duplicate Name
    Given some context is provided
    When  taking some action
    Then  some result is observed

  Scenario: Duplicate Name
    Given some context is provided
    When  taking some action
    Then  some result is observed

  Scenario: Unique Name
    Given some context is provided
    When  taking some action
    Then  some result is observed
