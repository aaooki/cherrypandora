module Panadoura
  module Repositories
    class Entry
      def initialize(connection)
        @connection = connection
      end

      def all_by_user_id(user_id)
        @connection.where(user_id: user_id)
      end
    end
  end
end
