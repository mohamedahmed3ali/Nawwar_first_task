class OwnershipController < ApplicationController
  def create
  	@user = User.find(params[:id])
  	@group = Group.find(params[:group_id])
  	@ownership = Ownership.new
  	@ownership.editor = @user
  	@ownership.group = @group
  	@ownership.save
  end

  def index
  	@group = Group.find(params[:group_id])
  end

  def delete
  end
end
