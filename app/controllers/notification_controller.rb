class NotificationController < ApplicationController
  def create
    FollowerNotifierMailer.inform(current_user, params[:email]).deliver_now
    flash[:notice] = "Successfully sent email."
    # redirect_to
  end
end
