module Panadoura
  module Commands
    class User
      def initialize(connection)
        @connection = connection
      end

      def create(**args)
        @connection.insert(args)
      end
    end
  end
end
