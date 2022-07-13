# frozen_string_literal: true

require "test_helper"

module Konfiguracja
  class TestLoaders < Minitest::Spec
    describe ".default_loaders" do
      it "returns registry" do
        assert_instance_of Loaders::Registry, Loaders.default_loaders
      end
    end
  end
end
