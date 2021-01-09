# NatureRemoE

Nature Remo API client for Nature Remo E

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nature_remo_e'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install nature_remo_e

## Usage

```ruby
require 'nature_remo_e'

client = NatureRemoE::Client.new('token')

client.echonetlite_properties
#=> {
#     :coefficient=>1,
#     :cumulative_electric_energy_effective_digits=>6,
#     :normal_direction_cumulative_electric_energy=>36039,
#     :cumulative_electric_energy_unit=>1,
#     :reverse_direction_cumulative_electric_energy=>10,
#     :measured_instantaneous=>630
#   }

client.coefficient
#=> 1

client.cumulative_electric_energy_effective_digits
#=> 6

client.normal_direction_cumulative_electric_energy
#=> 36039

client.cumulative_electric_energy_unit
#=> 1

client.reverse_direction_cumulative_electric_energy
#=> 10

client.measured_instantaneous
#=> 630
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/nature_remo_e. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/nature_remo_e/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NatureRemoE project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/nature_remo_e/blob/master/CODE_OF_CONDUCT.md).
