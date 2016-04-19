# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'evtx/version'

Gem::Specification.new do |spec|
  spec.name          = 'evtx'
  spec.version       = Evtx::VERSION
  spec.authors       = ["Pluto 'n Bacon"]
  spec.email         = ['plutonbacon@dynosoft.org']
  spec.summary       = 'A pure Ruby parser for recent Windows Event Log files.'
  spec.description   = 'A pure Ruby parser for recent Windows Event Log files.'
  spec.homepage      = 'https://github.com/plutonbacon/evtx.rb.git'
  spec.license       = 'ISC'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir['lib/**/*'] + %w( README.md LICENSE )

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'bindata',              '~> 2.3.0'

  # Development only
  spec.add_development_dependency 'bundler',  '~> 1.11.2'
  spec.add_development_dependency 'pry',      '~> 0.10.3'
  spec.add_development_dependency 'rake',     '~> 10.5.0'
  spec.add_development_dependency 'rubocop',  '~> 0.37.2'
  spec.add_development_dependency 'rspec',    '~> 3.4.0'
  spec.add_development_dependency 'yard',     '~> 0.8.7.6'
end
