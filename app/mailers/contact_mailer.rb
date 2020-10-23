class ContactMailer < ApplicationMailer

  default from: 'kapibara.bba0924@gmail.com'

  def complete_registration(user)
    @user = user
    mail(:subject => "登録完了のお知らせ", :to => user.email)
  end
end
