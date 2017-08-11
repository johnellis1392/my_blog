module RequestHelper
  def basic_auth_headers
    { Authorization: "Basic #{encode_email_password(user.email, user.password)}" }
  end

  def mock_basic_auth_headers
    email = Faker::Internet.email
    password = Faker::RickAndMorty.quote
    { Authorization: "Basic #{encode_email_password(email, password)}" }
  end

  # TODO: Replace implicit parameter with user argument?
  # Token authentication:
  # https://thesocietea.org/2015/04/building-a-json-api-with-rails-part-3-authentication-strategies/
  def auth_headers
    { Authorization: "Token token=#{user.auth_token}" }
    # { Authorization: "Token #{encode_email_password(user.email, user.password)}" }
  end

  def mock_auth_headers
    # email = Faker::Internet.unique.email
    # password = Faker::RickAndMorty.quote
    # { Authorization: "Token token=#{encode_email_password(email, password)}" }
    { Authorization: "Token token=#{SecureRandom.hex}" }
  end

  def json
    JSON.parse(response.body)
  end

  private

  def encode_email_password(email, password)
    Base64.encode64("#{email}:#{password}")
  end
end
