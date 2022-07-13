# frozen_string_literal: true

require "test_helper"

module Konfiguracja
  class TestConfig < Minitest::Spec
    include WithEnv

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

    it "assigns from env" do
      with_env(
        "DUMMY_HELLO" => "env hello",
        "DUMMY_NESTED__ERB" => "env nested"
      ) do
        config = DummyConfig.new

        assert_equal "env hello", config.hello
        assert_equal "env nested", config.nested.erb
      end
    end

    it "assigns from yaml" do
      config = DummyConfig.new

      assert_equal "world", config.hello
      assert_equal "value", config.nested.erb
    end

    it "assigns from overrides" do
      config = DummyConfig.new(
        hello: "explicit hello",
        nested: {erb: "explicit nested"}
      )

      assert_equal "explicit hello", config.hello
      assert_equal "explicit nested", config.nested.erb
    end

    it "prefers explicit over everything" do
      with_env("DUMMY_HELLO" => "foo") do
        config = DummyConfig.new(hello: "explicit")

        assert_equal "explicit", config.hello
      end
    end

    it "assigns from multiple sources" do
      with_env("DUMMY_HELLO" => "foo") do
        config = DummyConfig.new

        assert_equal "foo", config.hello
        assert_equal "value", config.nested.erb
      end
    end

    DevConfig = Class.new(Config) do
      attribute :foo, Dry.Types::String
      attribute :bar, Dry.Types::String
    end

    it "prefers local yaml over regular one" do
      local_yaml = Loaders::LocalYaml.new(
        config_path: "test/fixtures"
      )

      Konfiguracja.loaders.replace(:local_yaml, local_yaml)

      config = DevConfig.new

      assert_equal "FOO", config.foo
      assert_equal "BAR", config.bar
    end
  end
end
