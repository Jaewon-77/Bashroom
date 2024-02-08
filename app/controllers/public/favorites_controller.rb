class Public::FavoritesController < ApplicationController

  def create
    shoes_review = ShoesReview.find(params[:shoes_review_id])
    favorite = current_user.favorites.new(user_id: current_user.id, shoes_review_id: shoes_review.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    shoes_review = ShoesReview.find(params[:shoes_review_id])
    favorite = current_user.favorites.find_by(shoes_review_id: shoes_review.id)
    favorite.destroy
    redirect_to request.referer
  end





end
