module CherryTomato
  class User
    attr_reader :id, :username, :uid

    def inititalize(attrs)
      @id, @username, @uid = attrs.values_at(:id, :username, :uid)
    end
  end
end
