# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'revenant/version'

Gem::Specification.new do |spec|
  spec.name          = "revenant"
  spec.version       = Revenant::VERSION
  spec.authors       = ["CoralineAda"]
  spec.email         = ["coraline@idolhands.com"]

  spec.summary       = %q{Find dead methods in your Ruby code.}
  spec.description   = %q{Find dead methods in your Ruby code.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "analyst", ">= 1.0.0"
  spec.add_dependency "parser"
  spec.add_dependency "thor"
  spec.add_dependency "terminal-table"

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
