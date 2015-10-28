class FriendshipsController < ApplicationController
  def index
  	@user = User.find(current_user.id)
  	@friends = @user.friends
  end

  def create
  	
  end

  def delete
  end
end
