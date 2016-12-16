module CherryTomato
  class EntryRepository < ROM::Repository[:entries]
    commands :create

    def [](id)
      entries.where(id: id).one
    end

    def by_user_id(user_id)
      entries.where(user_id: user_id).one
    end

    def all
      entries.to_a
    end
  end
end

