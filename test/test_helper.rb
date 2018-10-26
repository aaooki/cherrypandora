ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

require File.expand_path 'lib/panadoura'
require File.expand_path 'app/application'

class TestHelper < MiniTest::Test
  include Rack::Test::Methods
end
