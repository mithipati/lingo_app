class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @groups = @user.groups
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
