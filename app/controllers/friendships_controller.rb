class FriendshipsController < ApplicationController
  def index
    # view friends of the current user
  	@user = User.find(current_user.id)
  	@friends = @user.friends
  end

  def create
    # creates friendship between the current user and the user he choose
  	if params[:id] != nil
	  	@friendship = Friendship.new(:user1_id => current_user.id, :user2_id => params[:id])
      # checks if the frienship is saved without errors
	  	if @friendship.save
	  		redirect_to(:controller => 'profile', :action => 'index', :id => params[:id])
	  	end
	else
	  		redirect_to(:controller => 'profile', :action => 'find_friends')
 	end
 end

  def delete
  end
end
