module Panadoura
  class EntryDecorator < Geckorate::Decorator
    def decorate
      {
        length: length,
        created_at: created_at.strftime("%d/%m/%Y %H:%M")
      }
    end
  end
end
