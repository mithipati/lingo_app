class MemesController < ApplicationController
  def show
    @meme = Meme.find(params[:id])
    send_data @meme.binary, :type => 'image/png', :disposition => 'inline'
  end
end
