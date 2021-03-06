class Api::V1::UsersController < ApplicationController
  def create
    EmailService.invite_followers(params)
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
