require "erb"
require "yaml"
require "dry-initializer"

module Konfiguracja
  module Loaders
    class Yaml
      extend Dry::Initializer

      option :config_path, proc { |path| Pathname.new(path) }
      option :suffix, default: proc { ".yml" }

      def load_for(config)
        config_file = config_path.join("#{config.config_name}#{suffix}")
        return {} unless config_file.file?

        config_file
          .read
          .then { |content| ERB.new(content).result }
          .then { |content| ::YAML.safe_load(content, aliases: true, symbolize_names: true) || Dry::Core::Constants::EMPTY_HASH }
      end
    end
  end
end
