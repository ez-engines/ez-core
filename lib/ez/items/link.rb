module Ez
  module Items
    class Link
      attr_reader :label, :path, :options

      def initialize(label, path, options = {})
        @label   = label
        @path    = path
        @options = options
      end
    end
  end
end
