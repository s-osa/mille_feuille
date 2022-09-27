# frozen_string_literal: true

require_relative "lib/mille_feuille/version"

Gem::Specification.new do |spec|
  spec.name = "mille_feuille"
  spec.version = MilleFeuille::VERSION
  spec.authors = ["Shunsuke Osa"]
  spec.email = ["hhelibebcnofnenamg@gmail.com"]

  spec.summary = "Barcode utility library"
  spec.description = "Utilities for barcode. MilleFeuille provides code validation, check digit calculation, symbol generation and etc."
  spec.homepage = "https://github.com/s-osa/mille_feuille"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/s-osa/mille_feuille/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "builder"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
