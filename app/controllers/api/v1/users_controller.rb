class Api::V1::UsersController < ApplicationController
  def create
    render json: User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
