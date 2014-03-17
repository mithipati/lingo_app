class WordsController < ApplicationController
  def create
    @word = Word.new(word_params)

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word added' }
        format.js {}
        format.json { render json: @word, status: :created, location: @word }
      else
        format.html { render action:"new" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    def word_params
      params.require(:word).permit(:name, :definition)
    end
end
