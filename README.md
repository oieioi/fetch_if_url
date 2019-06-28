[![Gem Version](https://badge.fury.io/rb/fetch_if_url.svg)](https://badge.fury.io/rb/fetch_if_url)
[![Build Status](https://travis-ci.com/oieioi/fetch_if_url.svg?branch=master)](https://travis-ci.com/oieioi/fetch_if_url)

# FetchIfUrl

Download a file to `/tmp` dir and return the path if it looks like URL.
If it looks like local path, return as it is.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fetch_if_url'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fetch_if_url

## Usage

```ruby
CSV.foreach(FetchIfUrl.fetch_if_url('https://example.org/some_heavy_csv.csv')) { |row| ... }
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oieioi/fetch_if_url. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FetchIfUrl project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/oieioi/fetch_if_url/blob/master/CODE_OF_CONDUCT.md).
