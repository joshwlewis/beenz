module AuthToken
  def self.create(user_id)
    payload = { user_id: user_id, exp: 1.hour.from_now.to_i }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.read(token)
    begin
      payload, _ = JWT.decode(token, Rails.application.secrets.secret_key_base)
      payload.fetch('user_id')
    rescue
      false
    end
  end
end
