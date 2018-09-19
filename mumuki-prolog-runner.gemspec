# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'

Gem::Specification.new do |spec|
  spec.name          = 'pl_blockly_runner'
  spec.version       = PrologVersionHook::VERSION
  spec.authors       = ['Agustin Pina']
  spec.email         = ['agus@mumuki.org']
  spec.summary       = 'Blockly Prolog Runner for Mumuki'
  spec.homepage      = 'http://github.com/GeniusDock/pl_blockly_runner'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/**']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'mumukit', '~> 2.17'
  spec.add_dependency 'prolog-blockly', '1.0.12'
  spec.add_dependency 'gobstones-board', '~>1.16'
  spec.add_dependency 'sinatra-cross_origin', '~> 0.4'
  spec.add_dependency 'watir','~> 6.14.0'
  spec.add_dependency 'webdrivers', '~> 3.0'


  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.4'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'mumukit-bridge', '~> 1.3'
end



