Dir.glob('./lib/**/*.rb').each { |file| require file unless File.basename(file) == File.basename(__FILE__) }
