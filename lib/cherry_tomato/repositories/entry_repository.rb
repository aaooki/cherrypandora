module Panadoura
  class EntryRepository < ROM::Repository[:entries]
    commands :create

    def [](id)
      entries.where(id: id).one
    end

    def by_user_id(user_id)
      entries.where(user_id: user_id).order(:created_at).reverse
    end

    def all
      entries
    end
  end
end

