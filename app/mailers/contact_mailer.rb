class ContactMailer < ApplicationMailer

  def send_when_admin_reply(user, contact)
    @user = user
    mail(:subject => "登録完了のお知らせ", to: user.email)
  end
end
