class WordsController < ApplicationController
  before_action :set_instance_variables, only: [:create]

  def create
    @word = @group.words.create(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @group, notice: "Word created" }
        format.json { render json: @word, status: :created, location: @word }
        format.js {}
      else
        format.html { redirect_to root, notice: "Sorry error found" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_instance_variables
      @group = Group.find(params[:group_id])
    end

    def word_params
      params.require(:word).permit(:name, :definition, :group_id)
    end

    def meme_params
      params.require(:meme).permit(:image, :top, :bottom, :word_id)
    end
end
