# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_rails_search/version'

Gem::Specification.new do |spec|
  spec.name          = 'mongoid_rails_search'
  spec.version       = MongoidRailsSearch::VERSION
  spec.authors       = ['Volodymyr Stashchenko']
  spec.email         = ['stashchenko@ukr.net']
  spec.summary       = %q{Easy search by mongoid models}
  spec.description   = %q{Simple plugin for searching objects in your project}
  spec.homepage      = 'https://github.com/Stashchenko/mongoid_rails_search'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ['lib']

  spec.add_dependency 'jquery-ui-rails', '>= 4.2.0'
  spec.add_dependency 'rails', '>= 3.0'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'

end
