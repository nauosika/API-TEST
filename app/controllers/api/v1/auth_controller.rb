class Api::V1::AuthController < ApplicationController
  before_action :authenticate_user!, only: [:logout]
  def signup
    user = User.new( email: params[:email], password: params[:password] )

    if user.save
      render json: { user_id: user.id, email: user.email}, status: 200
    else
      render json: { message: "Signup Failed", errors: user.errors }, status: 400
    end
  end

  def login
    if params[:email] && params[:password]
      user = User.find_by_email( params[:email] )
    end

    if user && user.valid_password?( params[:password] )
      render json: { message: "Login!",
                     auth_token: user.authentication_token,
                     user_id: user.id }, status: 200
    else
      render json: { message: "Email or Password wrong" }, status: 401
    end
  end

  def logout
    # 設計使用戶重新登入時，authentication_token會換。
    current_user.generate_authentication_token
    current_user.save!

    render json: { message: "See you!"}
  end

end
