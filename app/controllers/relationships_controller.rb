class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      redirect_back(fallback_location: root_path)
    else
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_to @user
    end
  end
  
  def following
		user = User.find(params[:user_id])
		@users = user.following
  end

  def followers
		user = User.find(params[:user_id])
		@users = user.followers
  end


  private

  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end