module CherryTomato
  class ROMConfig
    attr_reader :container

    def initialize
      rom_config = ROM::Configuration.new(:sql, load_db_settings)
      @container = ROM.container(rom_config)
    end

    def repository(repository_name)
      repository_name.new(@container)
    end

    private

    def load_db_settings
      user = 'root'
      password = ''
      host = '127.0.0.1'
      dbname = 'cherrypandora_dev'

      "postgres://#{host}/#{dbname}?user=#{user}&password=#{password}"
    end
  end
end
