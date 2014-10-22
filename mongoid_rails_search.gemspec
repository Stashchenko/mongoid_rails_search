# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_rails_search/version'

Gem::Specification.new do |spec|
  spec.name          = "mongoid_rails_search"
  spec.version       = MongoidRailsSearch::VERSION
  spec.authors       = ["vstashchenko"]
  spec.email         = ["vstashchenko@nravo.com"]
  spec.summary       = %q{Easy search by mongoid models}
  spec.description   = %q{Allows you create search forms}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "jquery-ui-rails", '>= 4.2.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"

end
