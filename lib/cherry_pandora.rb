require 'bundler'
Bundler.require :default, ENV['RACK_ENV']

Dir.glob('./lib/**/*.rb').each { |file| require file }
