# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-coub/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kirill Gorin"]
  gem.email         = ["me@kgor.in"]
  gem.description   = "Provides an OmniAuth strategy for Coub to make authentication with the Coub API simple"
  gem.summary       = "An OmniAuth strategy for Coub"
  gem.homepage      = "https://github.com/coub/omniauth-coub"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-coub"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Coub::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_development_dependency "rspec", "~> 2.7"
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
