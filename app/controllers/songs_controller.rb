class SongsController < ApplicationController
  def index
    render json: Song.all
  end

  def create
    song = Song.create(
      "title": params[:title],
      "album": params[:album],
      "artist": params[:artist],
      "year": params[:year],
    )
    render json: song
  end

  def show
    id = params[:id]
    song = Song.find(id)
    render json: song
  end

  def update
    song = Song.find(params[:id])
    song.title = params[:title] || song.title
    song.album = params[:album] || song.album
    song.artist = params[:artist] || song.artist
    song.year = params[:year] || song.year
    song.save

    render json: song
  end

  def destroy
    song = Song.find(params[:id])
    song.destroy

    render json: {message: "#{song.title} has been deleted....."}
  end
end
