
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "lucid_checkup/version"

Gem::Specification.new do |spec|
  spec.name          = "lucid_checkup"
  spec.version       = LucidCheckup::VERSION
  spec.authors       = ["Jeff Nyman"]
  spec.email         = ["jeffnyman@gmail.com"]

  spec.summary       = %q{Checks for test writing anti-patterns in a BDD context.}
  spec.description   = %q{Checks for test writing anti-patterns in a BDD context.}
  spec.homepage      = "https://github.com/jeffnyman/lucid_checkup"
  spec.license       = "MIT"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "pry"

  spec.post_install_message = %{
(::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)
  Lucid Checkup #{LucidCheckup::VERSION} has been installed.
(::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::) (::)
  }
end
