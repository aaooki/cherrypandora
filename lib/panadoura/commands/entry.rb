module Panadoura
  module Commands
    class Entry
      def initialize(connection)
        @connection = connection
      end

      def create(**args)
        @connection.insert(args)
      end
    end
  end
end
