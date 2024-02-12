class Admin::HomesController < ApplicationController
  def top
    @shoes_reviews = ShoesReview.all
    @user = User.all
    @comment = Comment.all
  end
end
