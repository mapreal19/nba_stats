# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nba_stats/version'

Gem::Specification.new do |spec|
  spec.name          = "nba_stats"
  spec.version       = NbaStats::VERSION
  spec.authors       = ["Mario Perez"]
  spec.email         = ["mapreal19@gmail.com"]

  spec.summary       = %q{Library that fetches Stats from Nba.com}
  spec.homepage      = "https://github.com/mapreal19/nba_stats"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.1'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec','~> 3.3.0'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'timecop'
  spec.add_development_dependency 'webmock', '~> 1.21.0'
  spec.add_development_dependency 'vcr', '~> 2.9.0'

  spec.add_dependency 'httparty', '~> 0.13.0'
end
