class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pan_images = @user.pan_images.page(params[:id])
  end

  def edit
    @user = User.find(paraams[:id])
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
end
