class Api::V1::UsersController < ApplicationController
  def create
    user = User.find_by(username: params["user"]["username"])
    if user
      user.update(updated_at: Time.now)
    else
      User.create(user_params)
      render json: "Sending emails to followers!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
