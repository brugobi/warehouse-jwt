class ApplicationController < ActionController::API
  before_action :authenticate_token!
  attr_reader :current_user
  
  private

    def authenticate_token!
      payload = JsonWebToken.decode(auth_token)
      @current_user = User.find(payload[0]["sub"])
    rescue JWT::ExpiredSignature
      render json: {errors: ["Token has expired"]}, status: :unauthorized
    rescue JWT::DecodeError
      render json: {errors: ["Invalid auth token"]}, status: :unauthorized
    end

    def auth_token
      @auth_token ||= request.headers.fetch("Authorization", "").split(" ").last
    end

end
