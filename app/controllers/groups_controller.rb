class GroupsController < ApplicationController
include ApplicationHelper

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @words = @group.words.all
    @word = Word.new

    @response = uni_get(response_for("font"))

    puts @response.body

  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:success] = "Group created"
      redirect_to @group
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    if @group.update_attributes(group_params)
      flash[:success] = "Group updated"
      redirect_to @group
    else
      render 'edit'
    end
  end

  private

    def group_params
      params.require(:group).permit(:name, :description)
    end
end
