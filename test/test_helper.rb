ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

class TestHelper < MiniTest::Test
  include Rack::Test::Methods
end
