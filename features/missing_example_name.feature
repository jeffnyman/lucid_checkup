Feature: Missing Example Name

  This cop looks for cases where scenario outline is providing examples
  but the examples group does not have a name.

  Scenario Outline: Valid Scenario Outline Without Example Names
    Given some context
    When  some <action>
    Then  some <result>

    Examples:
      | action | result |
      | test   | test   |

    Scenarios:
      | action | result |
      | test   | test   |
