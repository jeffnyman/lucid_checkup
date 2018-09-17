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
