Dir.glob('./app/**/*.rb').each { |file| require file }

module Panadoura
  class Application < Sinatra::Base
    register Sinatra::Namespace

    use SessionsHelper
    use CORSHelper

    namespace '/api' do
      before do
        halt(401, 'Unauthorized') unless RequestAuthenticator.new(request).call
      end

      get '' do
        content_type :json

        { msg: "Hello, World!" }.to_json
      end

      get '/tracker' do
        content_type :json

        entry_repo        = ROMConfig.new.repository(EntryRepository)
        entries           = entry_repo.by_user_id(RequestAuthenticator.new(request).current_user[:id])
        decorated_entries = EntryDecorator.decorate_collection(entries.to_a, 'Panadoura::Entry')

        { entries: decorated_entries }.to_json
      end

      post '/entry' do
        content_type :json

        entry_repo = ROMConfig.new.repository(EntryRepository)
        entry_repo.create(length: JSON.parse(request.body.read)['length'],
                          created_at: DateTime.now,
                          user_id: RequestAuthenticator.new(request).current_user[:id])

        halt(200)
      end
    end

    get '/' do
      File.read('app/public/index.html')
    end

    # Twitter auth
    use OmniAuth::Builder do
      provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    end

    get '/login' do
      redirect to("/auth/twitter")
    end

    get '/auth/twitter/callback' do
      response = env['omniauth.auth']

      if response
        user_repo = ROMConfig.new.repository(UserRepository)
        user      = user_repo.by_uid(response.uid)

        unless user
          user = user_repo.create(username: response.info.nickname, uid: response.uid)
        end

        jwt_token = JWTEncoderDecoder.encode(user_id: user.id, username: user.username, uid: user.uid)
        redirect "/#/authenticate?access_token=#{jwt_token}"
      else
        halt(401, 'Unauthorized')
      end
    end
  end
end
