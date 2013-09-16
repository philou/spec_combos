# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spec_combos/version'

Gem::Specification.new do |spec|
  spec.name          = "spec_combos"
  spec.version       = SpecCombos::VERSION
  spec.authors       = ["Philou"]
  spec.email         = ["philippe.bourgau@gmail.com"]
  spec.description   = %q{Rspec matchers to combine matchers together}
  spec.summary       = %q{Allows to build up matchers able to precisely match item from a collection for example}
  spec.homepage      = "http://github.com/philou/spec_combos"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "guard-rspec"
end
