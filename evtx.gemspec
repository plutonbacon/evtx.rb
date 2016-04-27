# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'evtx/version'

Gem::Specification.new do |spec|
  spec.name          = 'evtx'
  spec.version       = Evtx::VERSION
  spec.authors       = ['Cordoba Security']
  spec.email         = ['opensource@cordoba-sec.com']
  spec.summary       = 'A pure Ruby parser for recent Windows Event Log files.'
  spec.description   = 'A pure Ruby parser for recent Windows Event Log files.'
  spec.homepage      = 'https://github.com/cordoba-sec/evtx.rb.git'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.0.0'

  spec.files = Dir['lib/**/*'] + %w( README.md LICENSE )

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'bindata', '~> 2.3.0'

  # Development only
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'yard'
end
