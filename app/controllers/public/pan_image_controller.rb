class PanImageController < ApplicationController
  def new
    @pan_image = PanImage.new
  end

  def index
    @pan_image = PanImage.new(pan_image_params)
    @pan_image.user_id = current_user.id
    @pan_image.save
    redirect_to pan_images_path
  end

  def show
    @oan_image = PanImage.all
  end

  def delete
    pan_image = PanImage.find(id)
    pan_image.delete
    redirect_to pan_image_path
  end
  
   private

  def pan_image_params
    params.require(:pan_image).permit(:shop_name, :image, :caption)
  end
end
