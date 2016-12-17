module CherryTomato
  class Entry
    attr_reader :id, :length, :created_at, :user_id

    def inititalize(attrs)
      @id, @length, @created_at, @user_id = attrs.values_at(:id,
                                                            :length,
                                                            :created_at,
                                                            :user_id)
    end
  end
end
