# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-chef-oauth2/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-chef-oauth2"
  spec.version       = OmniAuth::ChefOAuth2::VERSION
  spec.authors       = ["Christian Nunciato"]
  spec.email         = ["cnunciato@getchef.com"]
  spec.summary       = %q{OmniAuth OAuth2 strategy for Chef.}
  spec.description   = %q{OmniAuth OAuth2 strategy for Chef.}
  spec.homepage      = "https://github.com/opscode/omniauth-chef-oauth2"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'omniauth', '~> 1.0'
  spec.add_dependency 'omniauth-oauth2', '~> 1.0'
end
