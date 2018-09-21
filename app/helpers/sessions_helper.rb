module Panadoura
  class SessionsHelper < Sinatra::Base
    configure do
      enable :sessions
      set :session_secret, ENV['SESSION_SECRET']
    end

    module UserSession
      def logged_in?
        not session[:user].nil?
      end

      def current_user
        session[:user]
      end

      def logout!
        session[:user] = nil
      end
    end
  end
end
