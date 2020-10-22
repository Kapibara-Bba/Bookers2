class RegistrationsController < ApplicationController
  
    before_action :set_user

    def create
      if @user.save
        ContactMailer.send_confirm_to_user(@user).deliver
        redirect_to @user
      end
    end

end
