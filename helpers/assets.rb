class Assets < Sinatra::Base
  configure do
    set :assets, (Sprockets::Environment.new { |env|
      env.append_path("assets/images")
      env.append_path("assets/javascripts")
      env.append_path("assets/stylesheets")
      env.append_path("assets/bower_components")

      # compress everything in production
      if ENV["RACK_ENV"] == "production"
        env.js_compressor  = :uglify
        env.css_compressor = :scss
      end
    })
  end

  get "/assets/app.js" do
    content_type("application/javascript")
    settings.assets["app.js"]
  end

  get "/assets/app.css" do
    content_type("text/css")
    settings.assets["app.css"]
  end

  %w{jpg png}.each do |format|
    get "/assets/:image.#{format}" do |image|
      content_type("image/#{format}")
      settings.assets["#{image}.#{format}"]
    end
  end

  # %w{css js}.each do |format|
  #   # get "/assets/bower_components/[\w]+/:file.#{format}" do |file|
  #   get %r{/assets/:file.#{format}} do |file|
  #     content_type("text/#{format}")
  #     settings.assets["#{file}.#{format}"]
  #   end
  # end

  # get "/assets/hi.css" do
  #   content_type("text/css")
  #   settings.assets["hi.css"]
  # end

  # get "/assets/hi.css" do
  #   content_type("text/css")
  #   settings.assets["hi.css"]
  # end
end
