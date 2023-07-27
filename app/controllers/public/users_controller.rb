class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pan_images = @user.pan_images.page(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path  
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
  def is_matching_login_user
  user = User.find(params[:id])
  unless user.id == current_user.id
    redirect_to pan_images_path
  end
  end
end
