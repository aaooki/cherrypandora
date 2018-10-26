module Panadoura
  module Helpers
    module AuthenticationHelper
      def logged_in?
        Services::RequestAuthenticator.new(request).call
      end

      def current_user
        Services::RequestAuthenticator.new(request).current_user
      end
    end
  end
end
