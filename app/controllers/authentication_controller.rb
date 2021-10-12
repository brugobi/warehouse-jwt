class AuthenticationController < ApplicationController
  before_action :set_user
  skip_before_action :authenticate_token!

  def create
    if @user.authenticate(params[:user][:password])
      render json: {token: JsonWebToken.encode({sub: @user.id}), user: @user.attributes.except("password_digest")}
    else
      render json: { errors: ["Invalid user"]}
    end
  end

  private
    def set_user
      @user = User.find_by(email: params[:user][:email])
    end

    def user_params
      params.require(:user).permit(:email, :password)
    end
end