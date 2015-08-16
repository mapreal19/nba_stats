# NbaStats
[![Build Status](https://travis-ci.org/mapreal19/nba_stats.svg)](https://travis-ci.org/mapreal19/nba_stats)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nba_stats'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nba_stats

## Resources

### Player

- Instance

```ruby
player = NbaStats::Player.new(id: 1717, league_id: '00')
player.attributes # => {:person_id=>1717, :first_name=>"Dirk", ...}
```

- All Players


```ruby
NbaStats::Player.all(leagued_id: '00',
                     season: guess_current_season, 
                     is_only_current_season: 1)
```

Returns an array of players from the NBA. 

Examples:

```ruby
NbaStats::Player.all # => [{:person_id=>203092, :display_last_comma_first=>"Zeller, Tyler", ...}, ...]
NbaStats::Player.all(league_id: '00', is_only_current_season: 0)
NbaStats::Player.all(league_id: '00', season: '2014-15', is_only_current_season: 1)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/mapreal19/nba_stats/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
