# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'TheGameOfLife/version'

Gem::Specification.new do |spec|
  spec.name          = "TheGameOfLife"
  spec.version       = TheGameOfLife::VERSION
  spec.authors       = ["Joel Taylor", "Olivier Lacan"]
  spec.email         = ["joel@codeschool.com", "hi@olivierlacan.com"]

  spec.summary       = %q{The best version ever of Conway's Game of Life}
  spec.description   = %q{The best version ever of Conway's Game of Life. Srsly.}
  spec.homepage      = "https://github.com/codeschool/TheGameOfLife"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
end
