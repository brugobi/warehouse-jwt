module JsonWebToken

  def self.encode(payload)
    JWT.encode payload, Rails.application.secrets.secret_key_base, 'HS256'
  end

  def self.decode(token)
    JWT.decode token, Rails.application.secrets.secret_key_base, 'HS256'
  end
end