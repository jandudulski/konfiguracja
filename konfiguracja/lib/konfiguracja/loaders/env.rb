# frozen_string_literal: true

module Konfiguracja
  module Loaders
    class Env
      SEPARATOR = "__"

      def load_for(config)
        prefix = "#{config.config_name.upcase}_"

        ENV.each_with_object(Hash.new { |h, k| h[k] = {} }) do |(key, val), acc|
          next unless key.start_with?(prefix)

          path = key
            .delete_prefix(prefix)
            .downcase
            .split(SEPARATOR)
            .map(&:to_sym)

          last_key = path.pop
          nested_part = path.reduce(acc) { |hash, part| hash[part] }
          nested_part[last_key] = val
        end
      end
    end
  end
end
