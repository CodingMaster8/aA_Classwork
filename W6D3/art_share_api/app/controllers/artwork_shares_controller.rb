class ArtworkSharesController < ApplicationController
  def index
    artwork_shares = ArtworkShares.all
    render json: artworks_shares
  end

  def create
    artwork_shares = ArtworkShares.new(artwork_shares_params)
    if artwork_shares.save
      render json: artwork_shares
    else
      render json: artwork_shares.errors.full_messages, status: :unprocessable_entity
    end
  end

  # def show
  #   artwork_shares = ArtworkShares.find_by(id: params[:id])

  #   if artwork_shares
  #     render json: artwork_shares
  #   else
  #     render plain: "artwork shares does not exist"
  #   end
  # end

  # def update
  #   artwork_shares = ArtworkShares.find_by(id: params[:id])

  #   if artwork_shares.update(artwork_shares_params)
  #     render json: artwork_shares
  #   else
  #     render json: artwork_shares.errors.full_messages, status: 422
  #   end
  # end

  def destroy
    artwork_shares = ArtworkShares.find_by(id: params[:id])
    artwork_shares.destroy
    render json: artwork_shares
  end

  private

	def artwork_shares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end
end
