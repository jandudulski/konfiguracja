# frozen_string_literal: true

require "test_helper"

module Konfiguracja
  class TestConfig < Minitest::Spec
    before do
      yaml = Loaders::Yaml.new(
        config_path: "test/fixtures"
      )

      Konfiguracja.loaders.replace(:yaml, yaml)
    end

    ImplicitConfig = Class.new(Config)

    it "has an implicit name" do
      assert_equal "implicit", ImplicitConfig.config_name
    end

    ExplicitConfig = Class.new(Config) do
      config.name = "foo"
    end

    it "has an explicit name" do
      assert_equal "foo", ExplicitConfig.config_name
    end

    AttrsConfig = Class.new(Config) do
      attribute :foo, Dry.Types::String
    end

    it "assigns explicit attrs" do
      config = AttrsConfig.new(foo: "explicit")

      assert_equal "explicit", config.foo
    end

    DummyConfig = Class.new(Config) do
      attribute :hello, Dry.Types::String
      attribute :nested do
        attribute :erb, Dry.Types::String
      end
    end

    it "assigns from yaml and overrides" do
      config = DummyConfig.new(hello: "me")

      assert_equal "me", config.hello
      assert_equal "value", config.nested.erb
    end
  end
end
