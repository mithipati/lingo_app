class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = current_user
    @groups = @user.groups
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
