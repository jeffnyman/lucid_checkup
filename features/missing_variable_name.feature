Feature: Missing Variable Name

  This cop looks for cases where a variable is referenced in a scenario
  but that reference does not exist.

  Scenario Outline: Simple Scenario Outline with Missing Variable
    Given a context is provided
    When <action> is taken
    Then <result> is observed

    Examples: Simple Actions
      | action |
      | test   |
