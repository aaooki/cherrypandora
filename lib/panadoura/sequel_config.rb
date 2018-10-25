module Panadoura
  class SequelConfig
    attr_reader :connection

    def initialize
      @connection = Sequel.connect(load_db_settings)
    end

    private

    def load_db_settings
      if ENV['RACK_ENV'] == 'production'
        ENV['DATABASE_URL']
      else
        user     = ENV['DB_USER']
        password = ENV['DB_PASSWORD']
        host     = ENV['DB_HOST']
        port     = ENV['DB_PORT']
        db_name  = ENV['DB_NAME']

        "postgres://#{user}:#{password}@#{host}:#{port}/#{db_name}"
      end
    end
  end
end
