class FollowerNotifierMailer < ApplicationMailer
  def inform(username, friend_contact)
    @user = username
    mail(to: friend_contact, subject: "#{username} invites you to GitGames!")
  end
end
