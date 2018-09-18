Feature: Unused Variable Name

  This cop looks for cases where a variable exists in a scenario but that
  variable is never referenced.

  Scenario Outline: Simple Scenario Outline with Unused Variable
    Given a context is provided
    And   a <data> condition is provided
    When <action> is taken
    Then a result is observed
    And  another result is observed with
      """
      <observation>
      """

    Examples: Simple Actions
      | action | result |
      | test   | test   |
