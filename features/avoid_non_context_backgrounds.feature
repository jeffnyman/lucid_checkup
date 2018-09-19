Feature: Avoid Non-Context Backgrounds

  This cop specifically looks for backgrounds that contain any non-context
  steps, which means any steps other than a Given.

  Background:
    Given some background context is provided
    When  taking some background action
    Then  make sure that context occurs

  Scenario: Simple Scenario with Background
    Given some context is provided
    When  some action is taken
    Then  some result is observed

  Scenario: Another Simple Scenario with Background
    Given some context is provided
    When  some action is taken
    Then  some result is observed
