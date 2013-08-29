# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cs_capacityretriever/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chip Childers"]
  gem.email         = ["chip.childers@gmail.com"]
  gem.description   = "Gem used to pull capacity statistics from an Apache CloudStack management server via the cloudstack_ruby_client gem"
  gem.summary       = "Get Apache CloudStack zone capacity data and push to a MongoDB server."
  gem.homepage      = "http://chipchilders.github.io/cs-operator-dashboard"
  gem.license       = 'ASLv2'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cs_capacityretriever"
  gem.require_paths = ["lib"]
  gem.version       = CsCapacityretriever::VERSION
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_dependency "mongo"
  gem.add_dependency "cloudstack_ruby_client"
  gem.add_dependency "json"
  gem.add_dependency "daemons"
end
