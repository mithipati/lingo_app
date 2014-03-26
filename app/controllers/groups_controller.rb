class GroupsController < ApplicationController
include ApplicationHelper


  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @words = @group.words.reverse
    @meme = Meme.new

    @response = uni_get(response_for('images'))

  end

  def show_form
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html { redirect_to @group }
      format.js {}
    end
  end

  def add_meme
    @meme = Meme.new
    @group = Group.find(params[:id])
    @response = uni_get(response_for('images'))

    respond_to do |format|
      # if @word.save
      #   if @meme.top.blank? && @meme.bottom.blank?
      #     # Figure out a way to not save meme without destroying it!
      #     @meme.destroy
      #   end
        format.html { redirect_to @group, notice: "Meme created" }
        format.json { render json: @word, status: :created, location: @word }
        format.js {}
      # else
        # format.html { redirect_to @group, notice: "Sorry error found" }
        # format.json { render json: @word.errors, status: :unprocessable_entity }
      # end
    end
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
      params.require(:group).permit(:name, :description, :group_pic)
    end
end
