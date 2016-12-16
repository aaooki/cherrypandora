module CherryTomato
  class UserRepository < ROM::Repository[:users]
    commands :create

    def [](id)
      users.where(id: id).one
    end

    def by_uid(uid)
      users.where(uid: uid).one
    end

    def all
      users.to_a
    end
  end
end
