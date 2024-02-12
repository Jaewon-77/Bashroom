class Admin::ReviewShoesReviewsController < ApplicationController
  
  def index
    @shoes_reviews = ShoesReview.all
    @users = User.all
  end

  def destroy
    @review_shoes_review = ReviewShoesReview.find(params[:id])
    @review_shoes_review.destroy
    redirect_to admin_review_comments_path
  end
  
end
  
  
  
