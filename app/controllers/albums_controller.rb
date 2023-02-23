class AlbumsController < ApplicationController
  def index
    @albums = Album.all.reverse
  end
  
  def show
    @album = Album.find(params[:id])
  end
  
  def new
    @album = current_user.albums.build
  end

  def create
    @album = current_user.albums.build(album_params)

    if @album.save
      redirect_to @album, notice: "Album was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])

    if @album.update(album_params)
      redirect_to @album, notice: "Album was successfully updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    redirect_to albums_path, status: :see_other, notice: "Album was successfully deleted!"
  end

  private
    def album_params
      params.require(:album).permit(:name, :artist, :album_cover_art, :review, :genre)
    end
end
