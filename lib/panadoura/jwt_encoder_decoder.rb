module JWTEncoderDecoder
  def self.encode(payload)
    JWT.encode(payload, ENV['SESSION_SECRET'])
  end

  def self.decode(token)
    payload = JWT.decode(token, ENV['SESSION_SECRET']).first
    HashWithIndifferentAccess.new payload
  rescue
    nil
  end
end
