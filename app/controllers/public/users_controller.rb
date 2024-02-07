class Public::UsersController < ApplicationController
  #before_action :authenticate_customer!

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to public_users_mypage_path, notice: "変更内容を保存しました。"
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    redirect_to public_top_path, notice: "退会処理を実行いたしました。"
  end

  private
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :address, :favorite_brand, :email, :favorite_shoes_name, :size, :age, :image)
  end


end