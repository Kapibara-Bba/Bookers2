class ContactMailer < ApplicationMailer
  
  def send_when_admin_reply(user, contact)
    @user = user
    @answer = contact.reply_text
    mail to: user.email, subject: '登録完了をお知らせ'
  end
end
