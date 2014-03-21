class MemesController < ApplicationController
  def create
    @meme = Meme.create(meme_params)
    @group = Group.find(params[:id])
    @word = Word.find(params[:word_id])

    if @meme.save
      redirect_to @group
    else
      render @word.group
    end
  end

  private
      def meme_params
        params.require(:meme).permit(:image,:top,:bottom,:word_id)
      end
end
