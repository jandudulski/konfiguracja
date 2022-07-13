# frozen_string_literal: true

require "test_helper"

module Konfiguracja::Loaders
  class TestLocalYaml < Minitest::Spec
    let(:loader) do
      LocalYaml.new(
        config_path: "./test/fixtures"
      )
    end

    describe "#load_for" do
      it "returns empty hash when missing file" do
        config = Minitest::Mock.new
        config.expect(:config_name, "missing")

        result = loader.load_for(config)

        assert_equal({}, result)
      end

      it "returns empty hash when empty file" do
        config = Minitest::Mock.new
        config.expect(:config_name, "empty")

        result = loader.load_for(config)

        assert_equal({}, result)
      end

      it "parses YAML" do
        config = Minitest::Mock.new
        config.expect(:config_name, "dev")

        result = loader.load_for(config)

        assert_equal({foo: "FOO"}, result)
      end
    end
  end
end
