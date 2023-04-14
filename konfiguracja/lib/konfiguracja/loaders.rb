# frozen_string_literal: true

module Konfiguracja
  module Loaders
    def self.default_loaders
      Registry
        .new
        .append(:yaml, Yaml.new(config_path: "./config"))
        .append(:local_yaml, LocalYaml.new(config_path: "./config"))
        .append(:env, Env.new)
    end
  end
end
