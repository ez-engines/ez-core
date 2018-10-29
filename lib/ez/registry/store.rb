# frozen_string_literal: true

require 'ez/registry/record'

module Ez
  class Registry
    class Store < Array
      attr_reader :records

      def initialize(*records)
        @records = *records
      end

      def add(data)
        records << Record.new(data, self)
      end

      def data
        map(&:data)
      end
    end
  end
end
