require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

$LOAD_PATH.push File.expand_path("../lib", __FILE__)
$LOAD_PATH.push File.expand_path("../app", __FILE__)

require 'panadoura'
require 'application'

run Panadoura::Application
