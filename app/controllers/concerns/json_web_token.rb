require 'jwt'

module JsonWebToken
  class EncoderJWT
    SECRET_KEY = Rails.application.secrets.secret_key_base.to_s
    def self.jwt_encode(payload)
      JWT.encode(payload, SECRET_KEY, 'HS256')
    end

    def self.jwt_decode(token)
      JWT.decode token, SECRET_KEY, true, { algorithm: 'HS256' }
    end
  end
end
