# frozen_string_literal: true

require "dry-configurable"
require "dry-struct"

require_relative "konfiguracja/version"

require_relative "konfiguracja/loaders"
require_relative "konfiguracja/config"

module Konfiguracja
  class Error < StandardError; end

  extend Dry::Configurable

  setting :loaders, default: Loaders.default_loaders, reader: true
  setting :inflector, default: Dry::Inflector.new
end
