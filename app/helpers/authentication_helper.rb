module Panadoura
  module Helpers
    module AuthenticationHelper
      def logged_in?
        db         = SequelConfig.new
        repository = Repositories::User.new(db.connection[:users])
        Services::RequestAuthenticator.new(request, repository).call
      end

      def current_user
        db         = SequelConfig.new
        repository = Repositories::User.new(db.connection[:users])
        Services::RequestAuthenticator.new(request, repository).current_user
      end
    end
  end
end
