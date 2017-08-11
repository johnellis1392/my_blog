class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Basic::ControllerMethods
  include ActionController::HttpAuthentication::Token::ControllerMethods

  include Response
  include ExceptionHandler

  # Filter for stopping invalid requests (before_filter is deprecated)
  before_action :authorize, except: [:token]
  # before_filter :authorize, only: :delete
  # before_filter :authorize, except: [:delete, :show]

  def token
    # Built-in basic http auth method
    # puts ' *** Authorization:'
    # puts request.headers['Authorization']
    # puts request.authorization

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
    render json: { message: 'Success!' }, status: 200
  end

  private

  def default_serializer_options
    { root: true }
  end

  def authorize
    # puts 'User:'
    # puts User.find_by(auth_token: token)
    # authenticate_with_http_token do |token, _options|
    #   puts 'Token: ', token
    #   user = User.find_by(auth_token: token)
    #   puts 'User: ', user
    # end

    unless authenticate_with_http_token { |token, _options| User.find_by(auth_token: token) }
      render json: { error: 'Bad Token' }, status: 401
    end
  end
end
