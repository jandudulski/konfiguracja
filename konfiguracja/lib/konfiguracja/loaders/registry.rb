# frozen_string_literal: true

require "forwardable"

module Konfiguracja::Loaders
  class Registry
    extend Forwardable

    def_delegator :registry, :empty?
    def_delegator :registry, :values, :handlers

    def initialize
      @registry = {}
    end

    def append(id, handler)
      raise ArgumentError if registry.key?(id)

      registry[id] = handler

      self
    end

    def find(id)
      registry.fetch(id) do
        raise ArgumentError, "loader `#{id}` not registered"
      end
    end

    def replace(id, handler)
      find(id)

      registry[id] = handler
    end

    private

    attr_reader :registry
  end
end
