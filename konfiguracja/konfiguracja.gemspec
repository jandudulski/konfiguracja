# frozen_string_literal: true

require_relative "lib/konfiguracja/version"

Gem::Specification.new do |spec|
  spec.name = "konfiguracja"
  spec.version = Konfiguracja::VERSION
  spec.authors = ["Jan Dudulski"]
  spec.email = ["jan@dudulski.pl"]

  spec.summary = "Configuration inspired by AnywayConfig but with DryStruct DSL"
  spec.description = "Configuration inspired by AnywayConfig but with DryStruct DSL"
  spec.homepage = "https://github.com/jandudulski/konfiguracja"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  github_uri = "https://github.com/jandudulski/konfiguracja"
  spec.metadata["bug_tracker_uri"] = "#{github_uri}/issues"
  spec.metadata["changelog_uri"] = "#{github_uri}/CHANGELOG.md"
  spec.metadata["documentation_uri"] = github_uri
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = github_uri

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-configurable", "~> 0.15"
  spec.add_dependency "dry-struct", "~> 1.0"
  spec.add_dependency "dry-initializer", "~> 3.0"

  spec.add_development_dependency "with_env", "~> 1.1"
end
