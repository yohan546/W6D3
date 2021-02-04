class ArtworksController < ApplicationController 
    def index 
        artist = User.find(params[:artist_id])
        render json: artist.artworks
        # render plain: "I'm in the index action!"
    end

    def create 
        # render json: params
        artwork = Artwork.new(artworks_params)
        # replace the `user_attributes_here` with the actual attribute keys
        if artwork.save
            render json: artwork
        else 
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show 
        artwork = Artwork.find(params[:id])
        render json: artwork
        # render json: params
    end

    def update
        # update looks similar to create, but instead of instantiating a new tweet to save to the database, we'll lookup the tweet we want to update in the database using the wildcard from the Url, which we find in the params object
            artwork = Artwork.find(params[:id])
           
            if artwork.update(artworks_params)
     
                redirect_to artworks_url(artwork)
            else
                render json: artwork.errors.full_messages, status: :unprocessable_entity
            end
       end

    

    def destroy
        artwork = Artwork.find(params[:id])
        artwork.destroy
        redirect_to artworks_url
    end

    private 

    def artworks_params 
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end

end