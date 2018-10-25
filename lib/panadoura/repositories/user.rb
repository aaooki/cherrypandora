module Panadoura
  module Repositories
    class User
      def initialize(connection)
        @connection = connection
      end

      def find_by_uid(uid)
        @connection.first(uid: uid)
      end
    end
  end
end
