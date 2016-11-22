# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rzdtc/version'

Gem::Specification.new do |spec|
  spec.name          = "rzdtc"
  spec.version       = Rzdtc::VERSION
  spec.authors       = ["kirqe"]
  spec.email         = ["railsr@yahoo.com"]

  spec.summary       = "Rzd tickets checker"
  spec.description   = "A gem for checking rzd train tickets"
  spec.homepage      = "http://github.com/kirqe/rzdtc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "httparty", "~> 0.13.7"
  spec.add_development_dependency "activesupport", "~> 5.0"
  spec.add_development_dependency "rspec", "~> 3.4.0"
end
