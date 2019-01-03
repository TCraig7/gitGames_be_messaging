class FollowerNotifierMailer < ApplicationMailer
  def inform(user, friend_contact)
    @user = user
    mail(to: friend_contact, subject: "#{user.username} invites you to GitGames!")
  end
end
