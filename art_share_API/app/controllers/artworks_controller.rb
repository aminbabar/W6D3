class ArtworksController < ApplicationController

    def index
        artworks_owned = Artwork.find_by(artist_id: params[:id])
        # artwo
        # @artworks = Artwork.all
        # render json: @artworks 
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