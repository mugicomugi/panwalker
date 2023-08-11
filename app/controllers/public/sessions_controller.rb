# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  protected

  # 会員の論理削除のための記述。退会後は、同じアカウントでは利用できない。
  def user_state
    @user = User.find_by(email: params[:customer][:email])
    if @user #@customerに値が入っていたら　という意味
      if @user.valid_password?(params[:customer][:password]) && (@user.is_deleted == true)
        #is deleted = 削除されている　= failse 削除されていない =true 削除されている
        #ここでは退会している条件式を書く　よって　true
        flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
        redirect_to root_path
      else
        flash[:notice] = "項目を入力してください"
      end
    end
  end
end
