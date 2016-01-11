require 'bundler'
Bundler.require

Dir.glob('./**/*.rb').each { |file| require file }

use Assets
run Sinatra::Application
