class UserMailer < ApplicationMailer

  def auth_confirm(user)
    token = user.email_token
    @url = "confirm_user?token=#{token}"
    mail(to: @user.email)
  end

end
