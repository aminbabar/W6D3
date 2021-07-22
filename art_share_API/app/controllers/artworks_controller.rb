class ArtworksController < ApplicationController

    def index
        @artworks = Artwork.all
        render json: @artworks 
    end

    def show 
        @artwork = Artwork.find(params[:id])
        render json: @artwork 
    end

    def update 
        @artwork = Artwork.find(params[:id])

    end

    private

    def artwork_params
        params[:artwork].permit(:title, :image_url, :artist_id)
    end
end