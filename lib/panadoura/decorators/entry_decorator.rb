module Panadoura
  module Decorators
    class EntryDecorator < Geckorate::Decorator
      def decorate
        {
          length: self[:length],
          created_at: self[:created_at].strftime("%d/%m/%Y %H:%M")
        }
      end
    end
  end
end
