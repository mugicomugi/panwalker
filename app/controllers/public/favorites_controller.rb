class Public::FavoritesController < ApplicationController
    
    def create
        pan_image = PanImage.find(params[:pan_image_id])
        favorite = current_user.favorites.new(pan_image_id: pan_image.id)
        favorite.save
        redirect_to pan_image_path(pan_image)
    end
    
    def destroy
        pan_image = PanImage.find(params[:pan_image_id])
        favorite = current_user.favorites.find_by(pan_image_id: pan_image.id)
        favorite.destroy
        redirect_to pan_image_path(pan_image)
    end
end
