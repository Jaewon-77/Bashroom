# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to public_homes_top_path, notice: "guestuser login sucessful"
  end

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
  private
# アクティブであるかを判断するメソッド
def user_state
    user = User.find_by(email: params[:user][:email])# 【処理内容1】 入力されたemailからアカウントを1件取得
    return if user.nil?# 【処理内容2】 アカウントを取得できなかった場合、このメソッドを終了する
    return unless user.valid_password?(params[:user][:password])# 【処理内容3】 取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    unless user.is_active# 【処理内容4】 アクティブでない会員に対する処理
      reset_session
      flash[:alert] = "すでに退会しています。"
      redirect_to new_user_registration_path
    end
end




end


