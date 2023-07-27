class Public::PanImagesController < ApplicationController
  def new
    @pan_image = PanImage.new
  end

  def create
    @pan_image = PanImage.new(pan_image_params)
    @pan_image.user_id = current_user.id
    if @pan_image.save
      redirect_to pan_images_path
    else
      render :new
    end
  end
  
  def index
    @pan_images = PanImage.page(params[:page])
  end

  def show
    @pan_image = PanImage.find(params[:id])
    @pan_comment = PanComment.new
  end

  def delete
    @pan_image = PanImage.find(params[:id])
    @pan_image.delete
    redirect_to pan_images_path
  end
  
   private

  def pan_image_params
    params.require(:pan_image).permit(:shop_name, :image, :caption)
  end
end
