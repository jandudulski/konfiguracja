# frozen_string_literal: true

require "test_helper"

module Konfiguracja::Loaders
  class TestRegistry < Minitest::Spec
    let(:registry) { Registry.new }

    it "starts empty" do
      assert_empty registry
    end

    describe "#append" do
      it "raises error when already registered" do
        registry.append(:foo, "foo")

        assert_raises ArgumentError do
          registry.append(:foo, "bar")
        end
      end

      it "allows to append a handler" do
        registry.append(:foo, "foo")
        registry.append(:bar, "bar")

        assert_equal %w[foo bar], registry.handlers
      end
    end

    describe "#find" do
      it "raises an error if not yet registered" do
        assert_raises ArgumentError do
          registry.find(:foo)
        end
      end

      it "returns a handler" do
        registry.append(:foo, "foo")

        assert_equal "foo", registry.find(:foo)
      end
    end

    describe "#replace" do
      it "raises error if not yet registered" do
        assert_raises ArgumentError do
          registry.replace(:foo, "foo")
        end
      end

      it "replaces handler" do
        registry.append(:foo, "bar")
        registry.replace(:foo, "foo")

        assert_equal "foo", registry.find(:foo)
      end
    end
  end
end
