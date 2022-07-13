# frozen_string_literal: true

require "test_helper"

module Konfiguracja::Loaders
  class TestEnv < Minitest::Spec
    include WithEnv

    let(:loader) do
      Env.new
    end

    describe "#load_for" do
      it "returns empty hash when nothing provided" do
        config = Minitest::Mock.new
        config.expect(:config_name, "missing")

        result = loader.load_for(config)

        assert_equal({}, result)
      end

      it "returns variables prefixed with config name" do
        with_env(
          "FOO_BAR_HELLO" => "world",
          "FOO_BAR_NESTED__KEY" => "value"
        ) do
          config = Minitest::Mock.new
          config.expect(:config_name, "foo_bar")

          result = loader.load_for(config)

          assert_equal({hello: "world", nested: {key: "value"}}, result)
        end
      end
    end
  end
end
