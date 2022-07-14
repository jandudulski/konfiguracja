module Konfiguracja
  module Rails
    module Loaders
      class Credentials
        def load_for(config)
          config_name = config.config_name.to_sym

          return Dry::Core::Constants::EMPTY_HASH unless ::Rails.application.credentials.config.key?(config_name)

          ::Rails.application.credentials[config_name]
        end
      end
    end
  end
end
