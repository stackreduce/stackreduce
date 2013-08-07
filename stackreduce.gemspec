# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stackreduce/version'

Gem::Specification.new do |spec|
  spec.name          = "stackreduce"
  spec.version       = Stackreduce::VERSION
  spec.authors       = ["Yannis Kolovos"]
  spec.email         = ["yannis.kolovos@gmail.com"]
  spec.description   = %q{Stackreduce.com API Wrapper}
  spec.summary       = %q{Stackreduce gem its a Rails API Wrapper for Stackreduce.com}
  spec.homepage      = "http://www.stackreduce.com"
  spec.license       = "MIT"

  spec.files = Dir['README.md', 'lib/**/*']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_dependency "thor"
  spec.add_dependency('activesupport')
  spec.add_dependency('faker')
  
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "aruba"
end
