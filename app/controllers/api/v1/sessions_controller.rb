class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.new(user_params)
      if @user.save
        render json: @user, status: 200
      else
        render json: {erroe: "create failed"}
      end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(
      :email,
      :password,
      :encrypted_password
    )
  end
end
