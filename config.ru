require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

# require './settings'

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
$LOAD_PATH.push File.expand_path("../app", __FILE__)

require 'cherry_tomato'
require 'application'

run Panadoura::Application
