class SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def show
    id = params[:id]
    song = Song.find(id)
    render json: song
  end
end
