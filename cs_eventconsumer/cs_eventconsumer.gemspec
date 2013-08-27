# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cs_eventconsumer/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Chip Childers"]
  gem.email         = ["chip.childers@gmail.com"]
  gem.description   = "Gem used to consume the AMQP event stream that Apache CloudStack can be configured to send to a RabbitMQ broker, sending them to a MongoDB server."
  gem.summary       = "Consume Apache CloudStack events and push to a MongoDB server."
  gem.homepage      = "http://chipchilders.github.io/cs-operator-dashboard"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cs_eventconsumer"
  gem.require_paths = ["lib"]
  gem.version       = CsEventconsumer::VERSION
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_dependency "mongo"
  gem.add_dependency "bunny"
  gem.add_dependency "json"
  gem.add_dependency "daemons"
end
