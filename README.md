# Konfiguracja

`Konfiguracja` is a flexible DSL for configurations inspired by [anyway_config](https://github.com/palkan/anyway_config) gem and powered by [dry-rb](https://dry-rb.org/) stack.

## Features

| Feature | Rails | Anyway Config | Konfiguracja |
| --- | ---:| ---:| ---:|
| Load data from `config/app.yml` | ✅ | ✅ | ✅ |
| Load data from `secrets` | ❌ | ✅ | TODO |
| Load data from `credentials` | ❌ | ✅ | TODO |
| Load data from environment | ❌ | ✅ | TODO |
| Load data from [custom sources](#loaders) | ❌ | ✅ | ✅ |
| Local config files | ❌ | ✅ | TODO |
| Type coercion | ❌ | ✅ | ✅ |
| [Source tracing](#tracing) | ❌ | ✅ | TODO |
| Return Hash with indifferent access | ❌ | ✅ | ❌ |
| Support ERB\* within `config/app.yml` | ✅ | ✅ | ✅ |
| Raise if file doesn't exist | ✅ | ❌ | ❌ |
| Works without Rails | 😀 | ✅ | ✅ |
| Shouts when required data not provided | ❌ | ✅ | ✅ |

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add konfiguracja

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install konfiguracja

## Usage

To define a config inherit from `Konfiguracja::Config` and declare attributes with [dry-struct](https://dry-rb.org/gems/dry-struct/) DSL:

```ruby
class AppConfig < Konfiguracja::Config
  attribute :foo, Dry.Types::String
  attribute :nested do
    attribute :bar, Dry.Types::Boolean
  end
end
```

Such config will load data from:

* `config/app.yml`
* `config/app.local.yml`
* `APP_FOO`, `APP_NESTED__BAR` environment variables
* explicit values passed to initializer

## Configuration

*TODO*

## Loaders

*TODO*

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/konfiguracja. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/konfiguracja/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Konfiguracja project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/konfiguracja/blob/main/CODE_OF_CONDUCT.md).
