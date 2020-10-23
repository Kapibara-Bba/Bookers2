class RegistrationsController < ApplicationController

  def create
    super
    ContactMailer.complete_registration(user).deliver
  end

end
