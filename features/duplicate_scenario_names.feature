Feature: Duplicate Scenario Names

  This cop looks for cases where there are multiple scenarios in a
  feature file with the same name.

  Scenario: Duplicate Name
    Given some context
    When  some action
    Then  some result

  Scenario: Duplicate Name
    Given some context
    When  some action
    Then  some result

  Scenario: Unique Name
    Given some context
    When  some action
    Then  some result
