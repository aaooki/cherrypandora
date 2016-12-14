require 'bundler'
Bundler.require

Dir.glob('./lib/**/*.rb').each { |file| require file }
