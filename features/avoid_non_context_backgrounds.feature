Feature: Avoid Non-Context Backgrounds

  This cop specifically looks for backgrounds that contain any non-context
  steps, which means any steps other than a Given.

  Background:
    Given some background context
    When  some background action

  Scenario: Simple Scenario with Background
    Given some context
    When  some action
    Then  some result

  Scenario: Another Simple Scenario with Background
    Given some context
    When  some action
    Then  some result
