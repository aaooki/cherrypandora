module Panadoura
  class SessionsHelper < Sinatra::Base
    configure do
      enable :sessions
      set :session_secret, ENV['SESSION_SECRET']
    end
  end
end
