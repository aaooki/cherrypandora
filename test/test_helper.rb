ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'bundler'
Bundler.require ENV['RACK_ENV']

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

include Rack::Test::Methods
