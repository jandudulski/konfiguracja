require_relative "lib/konfiguracja/rails/version"

Gem::Specification.new do |spec|
  spec.name = "konfiguracja-rails"
  spec.version = Konfiguracja::Rails::VERSION
  spec.authors = ["Jan Dudulski"]
  spec.email = ["jan@dudulski.pl"]

  spec.summary = "Rails integration for Konfiguracja gem"
  spec.description = "Rails integration for Konfiguracja gem"
  spec.license = "MIT"
  spec.homepage = "https://github.com/jandudulski/konfiguracja"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  github_uri = "https://github.com/jandudulski/konfiguracja"
  spec.metadata["bug_tracker_uri"] = "#{github_uri}/issues"
  spec.metadata["changelog_uri"] = "#{github_uri}/CHANGELOG.md"
  spec.metadata["documentation_uri"] = github_uri
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = github_uri

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3"
  spec.add_dependency "konfiguracja", "= 0.0.0"
end
