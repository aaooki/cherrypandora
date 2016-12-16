Dir.glob('./app/**/*.rb').each { |file| require file }

module CherryTomato
  class Application < Sinatra::Base
    use AssetsHelper
    use SessionsHelper

    helpers SessionsHelper::UserSession

    # Twitter auth
    use OmniAuth::Builder do
      provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    end

    get '/' do
      erb :timer
    end

    get '/public' do
      'public'
    end

    get '/private' do
      halt(401, 'Unauthorized') unless logged_in?
      'private'
    end

    get '/login' do
      redirect to("/auth/twitter")
    end

    get '/auth/twitter/callback' do
      response = env['omniauth.auth']

      if response
        user_repo = ROMConfig.new.repository(UserRepository)
        user = user_repo.by_uid(response.uid)
        unless user
          user = user_repo.create(username: response.info.nickname, uid: response.uid)
        end

        session[:user] = user.to_h
        redirect to '/'
      else
        halt(401, 'Unauthorized')
      end
    end

    get '/logout' do
      logout!
      "Logged out"
    end
  end
end
