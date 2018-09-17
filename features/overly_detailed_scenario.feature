Feature: Overly Detailed Scenario

  This cop looks for cases where scenarios are too long in the sense of their
  character count, which can imply steps that could be reduced by better use
  of domain language.

  Scenario: Overly Detailed Scenario
    Given a context made up of an initial setup along with some other bit of setup
    And   yet some other bit of necessary setup to provide for the scenario
    And   yet some another bit of setup because this is a complicated case
    When  an action is taken that is based on the provided context which is involved
    Then  some result that is a direct result of the action that was just taken
    And   some other result that is actually a related observable
    And   yet another part of the result that is technically related if you squint
