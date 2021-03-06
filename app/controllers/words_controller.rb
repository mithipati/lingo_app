class WordsController < ApplicationController
  include ApplicationHelper
  before_action :set_instance_variables, only: [:create]

  def show
    @word = Word.find(params[:id])
    @memes = @word.memes
  end

  def create
    @word = @group.words.new(word_params)
    @meme = @word.memes.new(meme_params)
    @response = uni_get(response_for('memes', name: @meme.image, top: @meme.top, bottom: @meme.bottom ))

    if !@meme.top.blank? || !@meme.bottom.blank?
      @meme.binary = @response.body
    end

    if @meme.image == ""
      @meme.binary = nil
    end

    respond_to do |format|
      if @word.save
        if @meme.top.blank? && @meme.bottom.blank?
          @meme.destroy
        end
        format.html { redirect_to @group, notice: "Word created" }
        format.json { render json: @word, status: :created, location: @word }
        format.js {}
      else
        format.html { redirect_to @group, notice: "Sorry error found" }
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
        params.require(:meme).permit(:image, :top, :bottom, :word_id, :binary)
      end
end
