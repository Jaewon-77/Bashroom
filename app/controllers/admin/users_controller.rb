class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to admin_user_path
    else
      flash[:notice] = "会員情報を更新に失敗しました。"
      render 'edit'
    end

  end


private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :age,
    :address, :favorite_brand, :email, :is_active, :favorite_shoes_name, :nickname, :size)

  end



end


