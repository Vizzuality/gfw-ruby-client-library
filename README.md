# Gfw API Client

[![Build Status](https://travis-ci.org/Vizzuality/gfw-ruby-client-library.svg)](https://travis-ci.org/Vizzuality/gfw-ruby-client-library) [![Coverage Status](https://coveralls.io/repos/Vizzuality/gfw-ruby-client-library/badge.svg)](https://coveralls.io/r/Vizzuality/gfw-ruby-client-library) [![Code Climate](https://codeclimate.com/github/Vizzuality/gfw-ruby-client-library/badges/gpa.svg)](https://codeclimate.com/github/Vizzuality/gfw-ruby-client-library) [![Inline docs](http://inch-ci.org/github/Vizzuality/gfw-ruby-client-library.svg?branch=master)](http://inch-ci.org/github/Vizzuality/gfw-ruby-client-library)

A Ruby Client library for the [GFW-API](https://github.com/wri/gfw-api). For now this library should not be used for any production apps.

## Requirements and Known Limitations

Tested with Ruby 2.0.0, 2.1.0, 2.2.0, JRuby (1.9 mode)

Requires Rails >= 4.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gfw_api_client'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gfw_api_client

Make the following constants, in config/gfw.yaml file:

```ruby
development:
  gfw_api_url: http://staging.gfw-apis.appspot.com

test:
  gfw_api_url: http://staging.gfw-apis.appspot.com

# Read values from the environment in production mode.
production:
  gfw_api_url: <%= ENV["GFW_API_URL"] %>
```

## Usage

Available data sets (table_space): imazon-alerts, umd-loss-gain, forma-alerts, nasa-active-fires, quicc-alerts, terrai-alerts

### Params:

  [table_space, concessions, wdpa_id, use_id, type, country, region, start_date, end_date, geo_json]

### Sample:
```ruby
  require 'gfw_api_client'

  GfwApiClient.find_set({'table_space' => 'forma-alerts', 'concessions' => 'iso', 'country' => 'BRA', 'region' => '3', 'start_date' => '2014-01-01', 'end_date' => '2015-01-01'})
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at http://github.com/vizzuality/gfw-ruby-client-library.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

