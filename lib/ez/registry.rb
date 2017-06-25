require 'singleton'

require 'ez/registry/store'
require 'ez/registry/record'

module Ez
  class Registry
    include Singleton

    class << self
      def in(key, by:, &block)

        get_or_initialize_store_by(key)

        add!(yield(Registry::Store.new), to: store[key], by: by)
      end

      def store(key = nil)
        @store ||= {}

        if key
          @store[key] || Registry::Store.new
        else
          @store
        end
      end

      def data(key)
        store(key).map(&:data)
      end

      private

      def get_or_initialize_store_by(key)
        store[key] || store[key] = Registry::Store.new
      end

      def add!(*collection, to: , by:)
        collection.flatten.each do |record|
          record.by = by
          to.push(record)
        end
      end
    end
  end
end
