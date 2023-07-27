class Public::PanCommentsController < ApplicationController
    
  def create
    pan_image = PanImage.find(params[:pan_image_id])
    comment = current_user.pan_comments.new(pan_comment_params)
    comment.pan_image_id = pan_image.id
    comment.save
    redirect_to pan_image_path(pan_image)
  end
  
  def destroy
    PanComment.find(params[:id]).destroy
    redirect_to pan_image_path(params[:pan_image_id])
  end

  private

  def pan_comment_params
    params.require(:pan_comment).permit(:comment)
  end
end