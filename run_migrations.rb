require 'pg'
require 'rom-repository'
require 'rom-sql'

# require './settings'
require './lib/cherry_tomato/rom_config'
require './lib/cherry_tomato/migrations'

# create the database first
# conn = PG::Connection.open(dbname: 'postgres', host: ENV['DB_HOST'], user: ENV['DB_USER'], password: ENV['DB_PASSWORD'])
# conn.exec("CREATE DATABASE #{ENV['DB_DATABASE']}")

# create the tables
CherryTomato.migrate