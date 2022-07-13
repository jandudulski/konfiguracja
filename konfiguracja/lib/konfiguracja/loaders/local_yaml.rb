module Konfiguracja
  module Loaders
    class LocalYaml < Yaml
      option :suffix, default: proc { ".local.yml" }
    end
  end
end
