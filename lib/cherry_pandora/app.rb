module CherryPandora
  class App < Sinatra::Base
    use AssetLoader

    get '/' do
      erb :timer
    end
  end
end
