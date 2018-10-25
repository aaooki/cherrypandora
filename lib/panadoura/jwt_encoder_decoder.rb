require 'date'

module Panadoura
  module JWTEncoderDecoder
    def self.encode(payload, expires_in: DateTime.now.next_month.strftime('%s'))
      payload[:exp] = expires_in

      JWT.encode(payload, ENV['SESSION_SECRET'])
    end

    def self.decode(token)
      JWT.decode(token, ENV['SESSION_SECRET']).first
    rescue
      nil
    end

    def self.expired?(payload)
      DateTime.strptime(payload['exp'], '%s') < DateTime.now
    end
  end
end
