class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  include Response
  include ExceptionHandler

  # Pundit logic for validating requests
  include Pundit
  # protect_from_forgery

  # Make sure user is authorized
  after_action :verify_authorized
  # after_action :verify_authorized, except: :index

  # Track policy_scope use
  # after_action :verify_policy_scoped, only: :index

  # Filter for stopping invalid requests (before_filter is deprecated)
  # before_action :authorize, except: %i[token quote_of_the_day set_quote]

  # before_filter :authorize, only: :delete
  # before_filter :authorize, except: [:delete, :show]

  # Caching example
  # def cache_key
  #   'quote'
  # end
  #
  # def set_quote
  #   quote = request.body.string
  #   # Rails.cache.{read, write, fetch}
  #   # Rails.cache.write("#{cache_key}/quote", quote)
  #   Rails.cache.write(cache_key.to_s, quote)
  #   render status: 204
  # end
  #
  # def quote_of_the_day
  #   # quote = Rails.cache.fetch("#{cache_key}/quote") do
  #   quote = Rails.cache.fetch(cache_key.to_s) do
  #     'WUBBA LUBBA DUB DUB!'
  #   end
  #
  #   render json: { quote: quote }
  # end

  def token
    # Built-in basic http auth method
    skip_authorization
    authenticate_with_http_basic do |email, password|
      user = User.find_by(email: email)
      if user && user.password == password
        render json: { token: user.auth_token }
      else
        render json: { error: 'Incorrect credentials' }, status: 401
      end
    end
  end

  def reauth
    skip_authorization
    render json: { message: 'Success!' }, status: 200
  end

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def default_serializer_options
    { root: true }
  end

  def authorize
    unless authenticate_with_http_token { |token, _options| User.find_by(auth_token: token) }
      render json: { error: 'Bad Token' }, status: 401
    end
  end

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    redirect_to(request.referrer || root_path)
  end
end
