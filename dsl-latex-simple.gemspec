# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dsl-latex-simple/version'

Gem::Specification.new do |gem|
  gem.name          = "dsl-latex-simple"
  gem.version       = Dsl::Latex::Simple::VERSION
  gem.authors       = ["Casiano Rodriguez Leon"]
  gem.email         = ["casiano.rodriguez.leon@gmail.com"]
  gem.description   = %q{Ruby DSL for LaTeX}
  gem.summary       = %q{Ruby DSL for LaTeX}
  gem.homepage      = "https://github.com/crguezl/dsl-latex-simple"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency 'highlight'
  #   gem.add_development_dependency 'rspec', '~> 2.7'
end
