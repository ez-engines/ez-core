# frozen_string_literal: true

require 'ostruct'

module Ez
  module Configurator
    def self.included(base)
      base.extend Engine
    end

    module Engine
      class Store < OpenStruct; end

      def configure
        yield(config)
      end

      def config
        @config ||= Store.new
      end
    end
  end
end
