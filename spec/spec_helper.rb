$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'nba_stats'
require 'byebug'
require 'timecop'
require 'webmock/rspec'
require 'vcr'

Dir['./spec/support/**/*.rb'].each { |f| require f }
