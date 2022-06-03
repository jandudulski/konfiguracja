module Konfiguracja
  module Loaders
    def self.default_loaders
      Registry
        .new
        .append(:yaml, Yaml.new(config_path: "./config"))
        .append(:env, Env.new)
    end
  end
end

require_relative "loaders/registry"
require_relative "loaders/yaml"
require_relative "loaders/env"
