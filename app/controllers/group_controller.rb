class GroupController < ApplicationController
  def index
    @groups = Group.sorted
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to(:action => 'index')
    else
      redirect_to(:action => 'new')
    end
  end
  
  def edit 
      @group = Group.find(params[:id])
  end

  def update 
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to(:action => 'show', :id => @group.id)
    else
      redirect_to(:action => 'edit', :id => @group.id)
    end
  end

  def delete
    @group = Group.find(params[:id])
  end

  def destroy
    group = Group.find(params[:id])
    Group.destroy(group)
    redirect_to(:action => 'index')
  end

  def follow
    @group = Group.find(params[:id])
    current_user.groups << @group
    redirect_to(:action => 'show', :id => @group.id)
  end

  def unfollow
    group = Group.find(params[:id])
    current_user.groups.delete(group)
    redirect_to(:action => 'index')
  end

  private
  def group_params
    params.require(:group).permit(:name, :image, :description)
  end
end
