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
        @friendship2 = Friendship.new(:user1_id => params[:id], :user2_id => current_user.id)
        # checks if the frienship is saved without errors
	  	if @friendship.save && @friendship2.save
	  		redirect_to(:controller => 'profile', :action => 'index', :id => params[:id])
	  	end
  	else
  	   redirect_to(:controller => 'profile', :action => 'find_friends')
   	end
 end

  def delete
    friend = User.find(params[:id])
    current_user.friends.delete(friend)
    friendships = Friendship.where("user2_id = ? AND user1_id = ?", current_user.id, friend.id)
    friendships.each do |friendship|
      Friendship.destroy(friendship)
    end
    redirect_to(:controller => 'profile', :action => 'index')
  end
end
