class ArtworksController < ApplicationController

  def index
    artworks = Artwork.left_outer_joins(:shared_artworks)
      .where('artist_id = ? OR viewer_id = ?', params[:user_id], params[:user_id])
      .distinct
    user_artworks = User.find(params[:user_id]).artworks.to_a
    user_shared_artworks = User.find(params[:user_id]).shared_artworks.to_a
    res = user_artworks + user_shared_artworks
    res.uniq!
    render json: res
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork = Artwork.find_by(id: params[:id])

    if artwork
      render json: artwork
    else
      render plain: "artwork does not exist"
    end
  end

  def update
    artwork = Artwork.find_by(id: params[:id])

    if artwork.update(artwork_params)
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def destroy
    artwork = Artwork.find_by(id: params[:id])
    artwork.destroy
    render json: artwork
  end

  private

	def artwork_params
    params.require(:artwork).permit(:title, :img_url, :artist_id)
  end

end
