require 'bundler'
Bundler.require

Dir.glob('./{helpers}/*.rb').each { |file| require file }
require './main'

use Assets
run Sinatra::Application
