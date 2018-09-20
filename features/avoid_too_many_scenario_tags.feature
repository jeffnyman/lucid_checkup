@tag1 @tag2
Feature: Too Many Tags

  This cop looks for cases where there are too many tags.

  @tag5 @tag6 @tag7 @tag8
  Scenario: Simple Scenario with Too Many Tags
    Given some context is provided
    When  some action is taken
    Then  some result is observed

  @tag10 @tag11
  Scenario: Simple Scenario with Acceptable Tags
    Given some context is provided
    When  some action is taken
    Then  some result is observed

  @tag12 @tag13 @tag14 @tag15 @tag16
  Scenario: Simple Scenario with Far Too Many Tags
    Given some context is provided
    When  some action is taken
    Then  some result is observed
