class ArtworksController < ApplicationController

    def index
        # user = User.find_by(id: params[:user_id])
        # artworks = user.artworks
        # artwork_shares  = user.shared_artworks

        # artwork_shared = User.select("artworks.*").joins(:shared_artworks).where(viewer_id: params[:user_id])
        # art = User.joins(:)
        # artworks_shared = ArtworkShare.find_by(viewer_id: params[:user_id])

        # debugger
        # render json: (artwork_shares.to_a + artworks.to_a) #.merge(artwork_shared))
        # artwo
        # @artworks = Artwork.all
        # render json: @artworks 

        artworks = Artwork.owned_viewed(params[:user_id])
        render json: artworks
    end

    def show 
        @artwork = Artwork.find(params[:id])
        render json: @artwork 
    end

    def update 
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end


    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork
    end


    def create
        # debugger
        @artwork = Artwork.new(artwork_params)

        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    private

    def artwork_params
        # debugger
        params[:artwork].permit(:title, :image_url, :artist_id)
    end
end