# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_hstore_accessor/version'

Gem::Specification.new do |spec|
  spec.name          = 'simple_hstore_accessor'
  spec.version       = SimpleHstoreAccessor::VERSION
  spec.authors       = ['Sergey D.']
  spec.email         = ['sclinede@gmail.com']
  spec.description   = %q{Simple Hstore Accessor extension for Rails 3}
  spec.summary       = %q{Simple Hstore Accessor extension for Rails 3}
  spec.homepage      = 'https://github.com/abak-press/simple_hstore_accessor'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '>= 3.1'
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'activerecord-postgres-hstore', '~> 0.6.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
