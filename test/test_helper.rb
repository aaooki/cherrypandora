ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'

require 'bundler'
Bundler.require :default, :test

require_relative '../main'

include Rack::Test::Methods
