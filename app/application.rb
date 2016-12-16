Dir.glob('./app/**/*.rb').each { |file| require file }

module CherryPandora
  class Application < Sinatra::Base
    use AssetLoader

    get '/' do
      erb :timer
    end

    # Twitter auth
    use OmniAuth::Builder do
      provider :twitter, 'key', 'secret'
    end

    configure do
      enable :sessions
    end

    helpers do
      def current_user?
        session[:user]
      end
    end

    get '/public' do
      'public'
    end

    get '/private' do
      halt(401, 'Unauthorized') unless current_user?
      'private'
    end

    get '/login' do
      redirect to("/auth/twitter")
    end

    get '/auth/twitter/callback' do
      session[:user] = true
      env['omniauth.auth']
    end

    get '/logout' do
      session[:user] = nil
      "Logged out"
    end
  end
end
