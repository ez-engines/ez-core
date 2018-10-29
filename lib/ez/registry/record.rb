# frozen_string_literal: true

module Ez
  class Registry
    class Record
      attr_reader :data
      attr_accessor :by

      def initialize(data, by)
        @data  = data
        @by    = by
      end

      def inspect
        "<Record by: #{by}, data: #{data}>"
      end
    end
  end
end
