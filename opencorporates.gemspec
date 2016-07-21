# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opencorporates/version'

Gem::Specification.new do |spec|
  spec.name          = "opencorporates"
  spec.version       = Opencorporates::VERSION
  spec.authors       = ["jcran"]
  spec.email         = ["jcran@pentestify.com"]

  spec.summary       = %q{API client for the Opencorporates API.}
  spec.description   = %q{API client for the Opencorporates API. OpenCorporates aims to do a straightforward (though big) thing: have a URL for every company in the world.}
  spec.homepage      = "https://opencorporates.com/"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rest-client"
  spec.add_development_dependency "json"
end
