require 'date'

module JWTEncoderDecoder
  def self.encode(payload, expires_in: DateTime.now.next_month.strftime('%s'))
    payload[:exp] = expires_in

    JWT.encode(payload, ENV['SESSION_SECRET'])
  end

  def self.decode(token)
    payload = JWT.decode(token, ENV['SESSION_SECRET']).first
    HashWithIndifferentAccess.new payload
  rescue
    nil
  end

  def self.expired?(payload)
    DateTime.strptime(payload[:exp], '%s') < DateTime.now
  end
end
