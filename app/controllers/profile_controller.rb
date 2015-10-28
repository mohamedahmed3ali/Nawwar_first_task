class ProfileController < ApplicationController
  def index
    # view the profile of the any user
  	if user_signed_in?
  		if params[:id] == nil
        # intialy views the profile of the current iser
  			@user = User.find(current_user.id)
  		else
  			@user = User.find(params[:id])
  		end
  	end
  end

  def find_friends
    # sorts users desc and views them all
  	@users = User.sorted
  end
end
