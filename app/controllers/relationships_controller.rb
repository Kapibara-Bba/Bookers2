class RelationshipsController < ApplicationController
  before_action :set_user
  
  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました。'
      redirect_to @user
    else
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました。'
      redirect_to @user
    else
      redirect_to @user
    end
  end
  
  private
  def 
    @user = User.find(params[:relationship][:follow_id])
  end
  
end
