Feature: Avoid Single Scenario Backgrounds

  This cop specifically looks for backgrounds that are part of a feature
  file that only has a single scenario.

  Background:
    Given some background context

  Scenario: Single Scenario with Background
    Given some context is provided
    When  some action is taken
    Then  some result is observed
