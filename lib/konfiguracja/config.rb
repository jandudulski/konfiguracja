# frozen_string_literal

module Konfiguracja
  class Config < Dry::Struct
    extend Dry::Configurable

    abstract

    setting :name

    def self.new(overrides = {})
      attrs = Konfiguracja
        .loaders
        .handlers
        .reduce({}) do |acc, loader|
          acc.merge(loader.load_for(self))
        end
        .merge(overrides)

      super(attrs)
    end

    def self.config_name
      config.name || name
        .then { |name| Konfiguracja.config.inflector.demodulize(name) }
        .then { |name| Konfiguracja.config.inflector.underscore(name) }
        .then { |name| name.delete_suffix("_config") }
    end
  end
end
