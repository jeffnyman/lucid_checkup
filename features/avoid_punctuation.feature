Feature: Avoid Punctuation

  This cop specifically looks for periods and exclamation marks.

  Question marks are considered okay becasue they can be used as part of
  predicate scenarios.

  Scenario: Steps With Period
    Given some context is provided.
    When  some action is taken.
    Then  some result is observed.
