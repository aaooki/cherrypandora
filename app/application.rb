Dir.glob('./app/**/*.rb').each { |file| require file unless File.basename(file) == File.basename(__FILE__) }

module Panadoura
  class Application < Sinatra::Base
    register Sinatra::Namespace

    use Helpers::SessionsHelper
    use Helpers::CORSHelper
    helpers Helpers::AuthenticationHelper

    namespace '/api' do
      before do
        halt(401, 'Unauthorized') unless logged_in?
      end

      get '' do
        content_type :json

        { msg: "Hello, World!" }.to_json
      end

      get '/tracker' do
        content_type :json

        db                = SequelConfig.new
        repository        = Repositories::Entry.new(db.connection[:entries])
        entries           =
          repository.all_by_user_id(current_user[:id]).reverse_order(:created_at)
        decorated_entries =
          Decorators::EntryDecorator.decorate_collection(entries.to_a, 'Panadoura::Decorators::Entry')

        { entries: decorated_entries }.to_json
      end

      post '/entry' do
        content_type :json

        db      = SequelConfig.new
        command = Commands::Entry.new(db.connection[:entries])
        command.create(length: JSON.parse(request.body.read)['length'],
                       created_at: DateTime.now,
                       user_id: current_user[:id])

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
        db         = SequelConfig.new
        repository = Repositories::User.new(db.connection[:users])
        user       = repository.find_by_uid(response.uid)

        unless user
          command = Commands::User.new(db.connection[:users])
          user    = command.create(username: response.info.nickname, uid: response.uid.to_i)
        end

        jwt_token = JWTEncoderDecoder.encode(user_id: user[:id], username: user[:username], uid: user[:uid])
        redirect "/#/authenticate?access_token=#{jwt_token}"
      else
        halt(401, 'Unauthorized')
      end
    end
  end
end
