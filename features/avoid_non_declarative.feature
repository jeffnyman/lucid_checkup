Feature: Avoid Non-Declarative

  This cop checks to see if there are non-declarative steps in a scenario.

  Scenario: A Scenario with Non-Declarative Steps
  Given some context
  When  some action
  Then  some result
