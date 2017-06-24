# Ez::Core

**Ez Engines** (read as "easy engines") - it's a collection of engines that allows you to prototype (or even release) [Rails](http://rubyonrails.org/) applications.
Small reusable features that help to be more DRY, developing business logic and spent time to engineering trivial features.

Heavily inspired by [dry-rb](http://dry-rb.org/), but for rails.

## Main principles

- Shoudl be easy
- Should have simple implementation
- Should deliver smart magic
- Should be easy to reuse across applications

## Contains

### `Ez::Configurator`

Simple pluggable configuration for using in any module:
```ruby
module MyEngine
  include Ez::Configurator
end

MyEngine.configure do |config|
  config.your_value = 'your value'
end

MyEngine.config.your_value # => 'your value'
MyEngine.config.your_value = 'new value'
MyEngine.config.your_value # => 'new value'
```

### `Ez::Registry`

Registry store for keep all knowledge in one place.
Use for store any values across different engines:
```ruby
Ez::Registry.in :my_registry, by: MyEngine do |registry|
  registry.add :first_value
  registry.add :second_value
end

Ez::Registry.in :my_registry, by: MyOtherEngine do |registry|
  registry.add :third_value
end

Ez::Registry.store(:my_registry) # =>
#  [
#    <Record by: MyEngine,      data: first_value>,
#    <Record by: MyEngine,      data: second_value>,
#    <Record by: MyOtherEngine, data: third_value>
#  ]
```

### Examples:
- Dependency inversion
- Extend feature list
- Scale apps without hard coded dependencies

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ez-core. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Ez::Core project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/ez-core/blob/master/CODE_OF_CONDUCT.md).
