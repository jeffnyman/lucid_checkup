Feature: Missing Example Name

  This cop looks for cases where scenario outline is providing examples
  but the examples group does not have a name.

  Scenario Outline: Valid Scenario Outline Without Example Names
    Given some context is provided
    When  some <action> is taken
    Then  some <result> is observed

    Examples:
      | action | result |
      | test   | test   |

    Scenarios:
      | action | result |
      | test   | test   |
