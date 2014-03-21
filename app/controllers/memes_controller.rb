class MemesController < ApplicationController
  def create
    @meme = Meme.new(meme_params)
    @group = Group.find(1)

    puts @meme.top

    if @meme.save
      redirect_to
    else
      render new
    end
  end

  private
      def meme_params
        params.require(:meme).permit(:image,:top,:bottom)
      end
end
