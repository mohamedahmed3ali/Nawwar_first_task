class ProfileController < ApplicationController
  def index
  	if user_signed_in?
  		if params[:id] == nil
  			@user = User.find(current_user.id)
  		else
  			@user = User.find(params[:id])
  		end
  	end
  end

  def find_friends
  	@users = User.sorted
  end
end
