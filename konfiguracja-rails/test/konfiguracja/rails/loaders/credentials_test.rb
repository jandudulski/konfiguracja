require "test_helper"
require "minitest/mock"

module Konfiguracja::Rails::Loaders
  class CredentialsTest < ActiveSupport::TestCase
    setup do
      @loader = Credentials.new
    end

    test "returns empty hash when missing key" do
      config = Minitest::Mock.new
      config.expect(:config_name, "missing")

      result = @loader.load_for(config)

      assert_equal({}, result)
    end

    test "returns value under the key" do
      config = Minitest::Mock.new
      config.expect(:config_name, "key")

      result = @loader.load_for(config)

      assert_equal({foo: "bar"}, result)
    end
  end
end
