Feature: Avoid Single Scenario Backgrounds

  This cop specifically looks for backgrounds that are part of a feature
  file that only has a single scenario.

  Background:
    Given some background context

  Scenario: Single Scenario with Background
    Given some context
    When  some action
    Then  some result
