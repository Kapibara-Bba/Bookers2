class RegistrationsController < ApplicationController
  
  def create
    super
    ContactMailer.send_when_admin_reply(@user).deliver
  end
end
