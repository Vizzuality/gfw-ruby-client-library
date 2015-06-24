# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gfw_api_client/version'

Gem::Specification.new do |s|
  s.name          = "gfw_api_client"
  s.version       = GfwApiClient::VERSION
  s.authors       = ["Sebastian Schkudlara"]
  s.email         = ["sebastian.schkudlara@vizzuality.com"]
  s.license       = "MIT"

  s.summary       = "Global Forest Watch Ruby API Client Library"
  s.description   = "A Ruby Client library for the Global Forest Watch API https://github.com/wri/gfw-api"
  s.homepage      = "http://github.com/vizzuality/gfw-ruby-client-library"

  s.extra_rdoc_files = ["README.md"]
  s.files = %w(gfw_api_client.gemspec Rakefile LICENSE CHANGELOG.md README.md Gemfile)

  s.rdoc_options = ["--main", "README.md"]

  s.files         = `git ls-files -z`.split("\x0")
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'typhoeus',      '~> 0.7'

  s.add_development_dependency 'rake',      '~> 10.0'
  s.add_development_dependency 'rspec',     '~> 3.1'
  s.add_development_dependency 'coveralls', '~> 0.8'
end
