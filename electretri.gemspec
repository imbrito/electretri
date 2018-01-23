
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "electretri/version"

Gem::Specification.new do |spec|
  spec.name          = "electretri"
  spec.version       = Electretri::VERSION
  spec.authors       = ["imbrito","kventura"]
  spec.email         = ["ismael.20rj@gmail.com","kissilasventura@gmail.com"]

  spec.summary       = %q{This gem implement the ELECTRE TRI algorithm.}
  spec.description   = %q{The main objective of this work is to implement the ELECTRE TRI algorithm, one of the main multicriteria
                          analysis algorithms. Consisting of evaluation criteria that allow to define alternatives that will be in
                          comparisons, thus allowing, to establish and classify alternatives in the multicriteria decision-making
                          environment, potentializing decision-making.}
  spec.homepage      = "https://github.com/imbrito/electretri"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.2.2'

  spec.add_runtime_dependency "activesupport"
  spec.add_runtime_dependency "builder"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
