# Lucid Checkup

Lucid Checkup provides solutions for checking out BDD-style test repositories for anti-patterns in terms of test expression.

## Installation

To get the latest stable release, add this line to your application's Gemfile:

```ruby
gem 'lucid_checkup'
```

To get the latest code:

```ruby
gem 'lucid_checkup', git: 'https://github.com/jeffnyman/lucid_checkup'
```

After doing one of the above, execute the following command:

    $ bundle

You can also install Lucid Checkup just as you would any other gem:

    $ gem install lucid_checkup

## Usage

### Lucid Cop

Lucid Checkup provides a Rubocop-like functionality called Lucidcop.

You can check an entire directory of features this like

`lucidcop features/*.feature`

Note that the default execution is to check all `.feature` files in a `features` directory. So the above command could have more easily been written as:

`lucidcop`

You can also run checks against a specific feature file:

`lucidcop features/one_of_my_features.feature`

Lucidcop provides errors and warnings. If there is at least one error, the return code will be set to -1. Otherwise, the return code will be set to 0. Warnings are for issues that do not influence the return code.

You can enable or disable certain cops with the use `--disable COP` or `--enable COP` and replacing "COP" with the name of the check.

Lucidcop provides its own configuration file for the execution. This file is called `default.yml` and will be used internally. If you have a custom configuration that you would like to run instead of passing enable and disable flags through the command line or instead of relying on the defaults, you can configure a `.lucidcop.yml` file that will be loaded on execution.

#### Cops

**MissingFeatureName**

This cop looks for cases where a feature does not have a name.

The reason for this cop is because while a feature name is not required for execution, it is part of providing clarity around expression. Feature names are used to provide a focus for the scenarios that should be going into the feature file. Specifically, each scenario should be a way to illustrate usage of the feature with the given name.

**MissingScenarioName**

This cop looks for cases where a scenario does not have a name.

The reason for this cop is because while a scenario name is not required for execution, it is part of providing clarity around expression. Scenario names are used to provide a focus for the steps that are part of the scenario. The names also provide insight into how a scenario differs from other scenarios in the same feature file.

**MissingScenarioAction**

This cop looks for cases where a scenario does not have an action (`When`) step.

The rationale here is obvious: a scenario should have a defined action.

Note: currently this will flag scenarios that are being defined with generic step keywords (`*`).

**MissingScenarioResult**

This cop looks for cases where a scenario does not have a result (`Then`) step.

The rationale here is obvious: a scenario should have a defined observable.

Note: currently this will flag scenarios that are being defined with generic step keywords (`*`).

**MissingExampleName**

This cop looks for cases where an `Examples` section is provided as part of a scenario outline but there is no name provided for the section. The check is also made for sections declared as `Scenarios`.

The reason for this cop is that example sections are meant to group together a set of data or test conditions that are meant to illustrate the scenario outline. Providing a name for this grouping allows you to make sure that the grouping is understood and that anything added to it is consistent with the purpose of the group.

**MissingVariableName**

This cop looks for cases where a variable is referenced in a scenario outline but that reference does not exist. Here's an example of what would trigger this:

```
Scenario Outline: Simple Scenario Outline with Missing Variable
  Given a context is provided
  When <action> is taken
  Then <result> is observed

  Examples: Simple Actions
    | action |
    | test   |
```

The cop is helping you find a bug in the test scenario that would ultimately cause a run-time error but beyond that this may be pointing to a case where either the variable has to be added or the step referencing the variable has to be removed. This kind of problem is very common in scenarios that get refactored.

**OverlyLongSteps**

This cop will check if any given step has 80 or more characters.

The reason for this cop is that long steps tend to indicate a problem with how the scenario is being expressed. For example, it might be the case that a certain long description in a Given should be replaced by a domain phrase. Or perhaps long When step is indicating that multiple actions are being taken, which suggests reducing the step to just the core action.

**OverlyLongScenario**

This cop will check if any given scenario has 10 or more steps.

The reason for this cop is that scenarios should generally be as declarative as possible and written as successful interaction with a feature based on business rules. When scenarios get long it suggests that implementation details are being used or that more concise business domain language should be used.

**OverlyDetailedScenario**

This cop will check if any given scenario has 450 or more characters.

The reason for this cop is that scenarios with this many characters tend to be written in a cumbersome way, with a lot more detail than is likely needed. This may also suggest that more business domain phrases are needed to better reveal the intent of the test.

**PreferFeatureDescription**

This cop looks for cases where a feature does not have a description.

Descriptions are what appear after the `Feature` keyword but before the first `Scenario` keyword in a feature file. These descriptions can be of any length.

This cop only triggers a warning, not an error.

**PreferSnakeCaseFileName**

This cop looks for cases where a feature file name is not snake case.

The rationale for this cop is simply to maintain a certain level of consistency with how feature files are named. The snake casing tends to be an agreed upon one for readability of file names.

This cop only triggers a warning, not an error.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec:all` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

The default `rake` command will run all tests as well as a RuboCop analysis.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at [https://github.com/jeffnyman/lucid_checkup](https://github.com/jeffnyman/lucid_checkup). The testing ecosystem of Ruby is very large and this project is intended to be a welcoming arena for collaboration on yet another test-supporting tool.

Everyone interacting in the Lucid Checkup project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jeffnyman/lucid_checkup/blob/master/CODE_OF_CONDUCT.md).

The Lucid Checkup gem follows [semantic versioning](http://semver.org).

To contribute to Lucid Checkup:

1. [Fork the project](http://gun.io/blog/how-to-github-fork-branch-and-pull-request/).
2. Create your feature branch. (`git checkout -b my-new-feature`)
3. Commit your changes. (`git commit -am 'new feature'`)
4. Push the branch. (`git push origin my-new-feature`)
5. Create a new [pull request](https://help.github.com/articles/using-pull-requests).

## Author

* [Jeff Nyman](http://testerstories.com)

## License

Lucid Checkup is distributed under the [MIT](http://www.opensource.org/licenses/MIT) license.
See the [LICENSE](https://github.com/jeffnyman/lucid_checkup/blob/master/LICENSE.md) file for details.
