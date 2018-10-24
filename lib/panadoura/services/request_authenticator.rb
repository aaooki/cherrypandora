module Panadoura
  class RequestAuthenticator
    def initialize(request)
      @request = request
    end

    def call
      valid_header? && valid_payload?
    end

    private

    def valid_header?
      !!@request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer/).flatten.first
    end

    def valid_payload?
      payload && !JWTEncoderDecoder.expired?(payload) && valid_user?
    end

    def valid_user?
      user_repo = ROMConfig.new.repository(UserRepository)
      user      = user_repo.by_uid(response.uid)

      !!user
    end

    def payload
      @payload ||= JWTEncoderDecoder.decode(access_token)
    end

    def access_token
      @request.env.fetch('HTTP_AUTHORIZATION', '').scan(/Bearer (.*)$/).flatten.last
    end
  end
end
