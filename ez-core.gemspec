# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ez/core/version'

Gem::Specification.new do |s|
  s.name        = 'ez-core'
  s.version     = Ez::Core::VERSION
  s.authors     = ['Volodya Sveredyuk']
  s.email       = ['sveredyuk@gmail.com']

  s.summary     = 'Core module for easy Rails apps via EzEngines'
  s.description = 'Core module for easy Rails apps via EzEngines'
  s.homepage    = 'https://github.com/ez-engines'
  s.license     = 'MIT'

  s.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 1.15'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop'
end
