# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bidu/active_ext/version'

Gem::Specification.new do |spec|
  spec.name = 'bidu-active_ext'
  spec.version = Bidu::ActiveExt::VERSION
  spec.authors = ['Bidu Developers']
  spec.email = ['dev@bidu.com.br']
  spec.summary = 'Active Extensions'

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activesupport', '~> 5.1.1'
  spec.add_runtime_dependency 'bidu-core_ext', '~> 1.2.4'

  spec.add_development_dependency 'activerecord', '~> 5.1.1'
  spec.add_development_dependency 'sqlite3'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 11.3.0'
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'rspec-mocks', '~> 2.99.4'
  spec.add_development_dependency 'simplecov', '~> 0.14.1'
end
