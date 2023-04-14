# frozen_string_literal: true

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.setup

require "dry-configurable"
require "dry-struct"

module Konfiguracja
  class Error < StandardError; end

  extend Dry::Configurable

  setting :loaders, default: Loaders.default_loaders, reader: true
  setting :inflector, default: Dry::Inflector.new
end
