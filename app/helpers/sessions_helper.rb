module CherryTomato
  class SessionsHelper < Sinatra::Base
    configure do
      enable :sessions
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
